FactoryGirl.define do
  factory :user do
    name "example"
    sequence(:email) { |i| "user-#{i}@example.com" }
    password "password"
  end
end
