require 'rails_helper'

describe "My Wardrobe" do

  let(:user) { create(:user) }

  context "No items have been added" do

    before do
      login_as(user, :scope => :user)
      visit "/users/#{user.id}/wardrobe"
    end

    it "displays a message 'No items'" do
      expect(page).to have_content("You have not added any clothes yet!")
    end
    
  end

end
