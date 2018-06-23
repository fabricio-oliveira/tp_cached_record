  # frozen_string_literal: true
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../spec/dummy/config/environment.rb', __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../../test/dummy/db/migrate', __FILE__)]
require 'simplecov'
require 'simplecov-rcov'
require 'spec_helper'
require 'rspec/rails'
require 'factory_girl_rails'
require 'mock_redis'
require 'faker'

if ENV['GENERATE_REPORTS'] == 'true'
  SimpleCov.formatters = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start 'rails'
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# mock redis with redis_mock
Redis = MockRedis

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
