require 'rails_helper'

describe "Request" do

  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "testthisthing@test.com", id: '101') }
  let(:item) {create(:item, user_id: user.id)}
  let(:request_params) { {user_id: user.id, item_id: item.id} }
  subject(:request) { item.requesters.build_with_user(request_params, user) }

  before do
    login_as(user, :scope => :user)
    new_image = create(:item, user_id: user.id)
    sign_out
    login_as(user_2, :scope => :user)
  end



  scenario "builds a request" do
    expect(request).to be_a(Requester)
  end

  scenario "user makes a request for an item" do
    visit "/items/#{item.id}"
    expect{click_link("Request")}.to change{Requester.count}.by(1)
  end
end
