# frozen_string_literal: true
FactoryGirl.define do
  factory :foo do
    uuid { SecurtyRandom.uuid }
    other { Faker::ChuckNorris.fact }
  end
end
