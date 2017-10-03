require 'faker'

FactoryGirl.define do
  factory :book do
    title  { Faker::Book.title }
    author { Faker::Book.author }
    year { Faker::Number.between(1500, 2000) }
    rating { Faker::Number.between(1, 10) }
  end
end