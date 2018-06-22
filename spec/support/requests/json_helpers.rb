# frozen_string_literal: true
require File.expand_path('../../requests', __FILE__)

module Requests::JsonHelpers
  def json
    JSON.parse(response.body)
  end
end
