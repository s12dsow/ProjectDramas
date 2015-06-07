FactoryGirl.define do
  factory :collection do
    user
    drama
    watched true
    rating 5
    review "Awesome drama"
  end
end
