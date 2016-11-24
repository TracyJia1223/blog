FactoryGirl.define do
  factory :user do
    username 'MyString'
    sequence(:email) { |n| Faker::Internet.email.gsub('@', "-#{n}@") }
    password 'MyString'
  end
end
