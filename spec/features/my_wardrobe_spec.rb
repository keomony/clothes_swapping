require 'rails_helper'

describe "My Wardrobe" do

  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "getlost@email.com", id: 2) }

  context "No items have been added" do
    before do
      login_as(user, :scope => :user)
      visit "/users/#{user.id}/wardrobe"
    end
    it "displays a message 'No items'" do
      expect(page).to have_content("You have not added any clothes yet!")
    end
  end

  context "Items have been added" do
    before do
      login_as(user, :scope => :user)
      @new_item = create(:item, user_id: user.id)
      @other_item = create(:item,
        size: "M",
        color: "Multi",
        category: "Top",
        description: "Hippy Jumper",
        image: fixture_file_upload(Rails.root.join('spec', 'files', 'images', 'hippy_jumper.jpg'), 'image/png'),
        user_id: user_2.id)
      visit "/users/#{user.id}/wardrobe"
    end

    it "displays the users items" do
      expect(page).to have_css("img[src*='pokemon_onesie.jpg']")
    end

    it "does not display other users items" do
      expect(page).not_to have_css("img[src*='hippy_jumper.jpg']")
    end

    it 'owner can edit a particular item' do
      visit "/items/#{@new_item.id}"
      expect(page).to have_css("img[src*='pokemon_onesie.jpg']")
      expect(page).to have_content('Edit')
      expect(page).to have_content('Destroy')
    end
  end


end
