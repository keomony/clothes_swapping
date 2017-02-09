require 'rails_helper'

describe "Request" do

  let(:agata) { create(:user) }
  let(:russell) { create(:user, email: "testthisthing@test.com", id: '101') }
  let(:agatas_item) {create(:item, user_id: agata.id)}

  subject(:request) { agatas_item.requesters.create(item_id: agatas_item.id, user_id: russell.id) }

  before do
    login_as(russell, :scope => :user)
  end

  scenario "builds a request" do
    expect(request).to be_a(Requester)
  end

  scenario "russell makes a request for agatas item" do
    visit "/items/#{agatas_item.id}"
    expect{click_button("Request")}.to change{Requester.count}.by(1)
  end

  scenario "agata can see the request russell has made" do
    visit "/items/#{agatas_item.id}"
    click_button("Request")
    sign_out
    login_as(agata, :scope => :user)
    visit "/users/#{agata.id}/profile/requests"
    expect(page).to have_content("#{russell.email}")
  end

  scenario "russell cannot request agata's item twice" do
    visit "/items/#{agatas_item.id}"
    click_button("Request")
    visit "/items/#{agatas_item.id}"
    click_button("Request")
    expect(page).to have_content "You have already requested this item"
  end

end
