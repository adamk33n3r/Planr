FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "someone#{n}@example.com" }
    name { ["Frank Sinatra", "Bill Gates", "Ryan Bates"].sample }
    uid "123456789"
    provider "google"
  end
end