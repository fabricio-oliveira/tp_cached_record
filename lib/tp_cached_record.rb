# frozen_string_literal: true
require 'active_record' unless defined? ActiveRecord
require 'connection_pool'
require 'tp/cache/record/base'

module CachedQuery
  module FindBy
    PREFIX_CONST = 'FIND_BY'

    def find_by(*args)
      super(*args)
    end

    alias really_find_by find_by

    def cached_find_by(*args)
      raise StandardError('unitialized redis') unless defined? @@redis_pool

      hash =  Digest::MD5.hexdigest(args.to_json)
      value = @@redis_pool.get("#{PREFIX_CONST}|#{hash}")
      return new(value.to_h) if value

      value = really_find_by(*args)
      @@redis_pool.set("#{PREFIX_CONST}|#{hash}", value, @@expire)
      value
    end

  end
end

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    extend Initialize
    def self.acts_as_cached
      extend TPCachedRecord
      singleton_class.send(:alias_method,:find_by,:cached_find_by)
    end
  end
end
