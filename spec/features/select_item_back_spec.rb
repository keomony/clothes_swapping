require 'rails_helper'

describe "Select back" do

  let(:russell) { create(:user) }
  let(:agata) { create(:user, email: "testthisthing@test.com", id: '101') }

  before do
    login_as(russell)
    russells_item = create(:item, user_id: russell.id)
    sign_out
    login_as(agata, :scope => :user)
    agatas_item = create(:item, user_id: agata.id)
    requester =  russells_item.requesters.create(item_id: russells_item.id, user_id: agata.id)
    sign_out
    login_as(russell, :scope => :user)
  end

  scenario "user makes a request back" do
    visit "/users/#{russell.id}/profile/requests"
    click_link("Their wardrobe")
    expect(page).to have_content("Request back")
    expect{click_link("Request back")}.to change{Selector.count}.by(1)
  end

  scenario "after the swap is done, not to request visible" do
    visit "/users/#{russell.id}/profile/requests"
    click_link("Their wardrobe")
    click_link("Request back")
    visit "/users/#{russell.id}/profile/requests"
    expect(page).not_to have_css("img[src*='pokemon_onesie.jpg']")
  end



end
