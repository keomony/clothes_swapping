require 'rails_helper'

describe "Request" do

  let(:user_1) { create(:user) }
  let(:user_2) { create(:user, email: "testthisthing@test.com", id: '101') }

  ## User 1 created an item
  let(:item) {create(:item, user_id: user_1.id)}

  ## User 2 requested that item
  subject(:request) { item.requesters.create(item_id: item.id, user_id: user_2.id) }

  before do
    login_as(user_2, :scope => :user)
  end

  scenario "builds a request" do
    expect(request).to be_a(Requester)
  end

  scenario "user makes a request for an item" do
    visit "/items/#{item.id}"
    expect{click_button("Request")}.to change{Requester.count}.by(1)
  end

  scenario "user can see the requests they have made" do
    ## User 2  is logged in and requests user 1's item
    visit "/items/#{item.id}"
    click_button("Request")
    sign_out
    ## User 1 logs in and sees user 2's request
    login_as(user_1, :scope => :user)
    visit "/users/#{user_1.id}/profile/requests"
    expect(page).to have_content("#{user_2.email}")
  end
end
