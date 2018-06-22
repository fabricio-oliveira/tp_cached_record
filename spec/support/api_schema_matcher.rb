# frozen_string_literal: true
RSpec::Matchers.define :match_response_schema do |version, schema|
  match do |json|
    schema_directory = "#{Rails.root}/spec/support/schemas/api/#{version}"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, json, strict: true)
  end
end
