# frozen_string_literal: true
FactoryGirl.define do
  factory :bar do
    uuid { SecureRandom.uuid }
    other { Faker::ChuckNorris.fact }
  end
end
