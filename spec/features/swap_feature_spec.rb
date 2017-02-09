require 'rails_helper'

describe "Swap" do

  let(:mony) { create(:user) }
  let(:jack) { create(:user, email: "testthisthing@test.com", id: '101') }
  #
  # let(:mony_item) {create(:item, user_id: mony.id, id: '200')}
  # let(:jack_item) {create(:item, user_id: jack.id, color: 'blue', description: "Squirtle Onesie", id: "201")}

  before do
    login_as(jack, :scope => :user)
    jack_item = create(:item, user_id: jack.id, color: 'blue', description: "Squirtle Onesie", id: "201")
    sign_out
    login_as(mony, :scope => :user)
    mony_item = create(:item, user_id: mony.id, id: '200')
    requester =  jack_item.requesters.create(item_id: jack_item.id, user_id: mony.id)
    sign_out
    login_as(jack, :scope => :user)
    visit "/users/#{jack.id}"
    click_link("Requests received")
    click_link("Their wardrobe")

  end

  scenario "build a selector" do
    expect{click_link("Request back")}.to change{Selector.count}.by(1)
  end

  scenario "user should see both items" do
    click_link("Request back")
    visit "/users/#{jack.id}"
    click_link("Swaps")
    expect(page).to have_css("img[src*='pokemon_onesie.jpg']")
  end
end
