FactoryGirl.define do

  factory :user do
    email "swap@clothes.com"
    password "123456"
    password_confirmation "123456"
    id '100'
  end
end
