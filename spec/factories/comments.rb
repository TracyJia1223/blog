FactoryGirl.define do
  factory :comment do
    body "MyText"
    # association :user, factory: :user
    association :post, factory: :post
  end
end
