FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    sequence(:title) { |n| "string #{n}" }
    body 'my string my string'
  end
end
