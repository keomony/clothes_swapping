include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :requester do
    item_id 1
    user_id 1
  end
end
