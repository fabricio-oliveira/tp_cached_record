# frozen_string_literal: true
require 'active_record' unless defined? ActiveRecord

module InitializeMethod
  def self.init(args = {})
    args[:port] ||= 6379
    @@expire = args[:expire] ||= 60 * 60 * 24 # sec * min * hour
    raise StandardError('url is empty') if args[:url].nil?
    @@redis_pool = ConnectionPool.new(size: 5, timeout: 5) do
      Redis.new(host: host, port: args[:port])
    end
  end
end

module CachedQuery
  module FindBy
    PREFIX_CONST = 'FIND_BY'

    class << self
      def find_by(*args)
        super(*args)
      end

      alias really_find_by find_by

      def cached_find_by(*args)
        hash =  Digest::MD5.hexdigest(args)
        value = @@redis_pool.get("#{PREFIX_CONST}|#{hash}")
        return new(value.to_h) if value

        value = really_find_by(*args)
        @@redis_pool.set("#{PREFIX_CONST}|#{hash}", value, @@expire)
        value
      end
    end

  end
end

module TPCachedRecord
  include InitializeMethod
  include CachedQuery::FindBy
end

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    def self.acts_as_cached
      include TPCachedRecord
      singleton_class.send(:alias_method,:find_by,:cached_find_by)
    end
  end
end
