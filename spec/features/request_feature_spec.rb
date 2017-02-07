require 'rails_helper'

describe "Request" do

  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "testthisthing@test.com", id: '101') }
  let(:item) {create(:item, user_id: user.id)}
  subject(:request) { item.requesters.create(item_id: item.id, user: user) }

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
    expect{click_button("Request")}.to change{Requester.count}.by(1)
  end

  xscenario "user can see the requests they have made" do
    visit "/items/#{item.id}"
    click_button("Request")
    visit "/users/#{user.id}/profile/requests"
    expect(page).to have_content("Pokemon onesie")
  end
end
