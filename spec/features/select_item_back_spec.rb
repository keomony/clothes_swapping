require 'rails_helper'

describe "Select back" do

  let(:user_1) { create(:user) }
  let(:user_2) { create(:user, email: "testthisthing@test.com", id: '101') }
  #
  ## User 1 created an item
  let(:item) {create(:item, user_id: user_1.id)}

  ## User 2 created an item
  # let(:item_2) {create(:item, user_id: user_2.id)}
  # ## User 2 requested an item from User 1
  # let(:request) { create(:requester, item_id: item.id, user_id: user_2.id) }
  #
  before do
    login_as(user_2, :scope => :user)
    item_2 = create(:item, user_id: user_2.id)
    requester =  item.requesters.create(item_id: item.id, user_id: user_2.id)
    login_as(user_1, :scope => :user)
  end



  scenario "user makes a request back" do
    visit "/users/#{user_1.id}/profile/requests"
    click_link("Their wardrobe")
    expect(page).to have_content("Request back")
    expect{click_link("Request back")}.to change{Selector.count}.by(1)

  end

  xscenario "after the swap is done, not to have picture of the item in the wardrobe" do
    visit "/users/#{user_1.id}/profile/requests"
    click_link("Their wardrobe")
    click_link("Request back")
    visit "/users/#{user_1.id}/profile/wardrobe"
    expect(page).not_to have_css("img[src*='pokemon_onesie.jpg']")
  end

end
