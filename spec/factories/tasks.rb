# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "Task Name"
    due "1969-01-01 00:00:00"
    level 1
    user
  end
end
