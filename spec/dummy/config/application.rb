# frozen_string_literal: true
require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)
require 'tp_cached_record'

module Dummy
  class Application < Rails::Application; end
end
