require 'rails_helper'

describe "My profile" do

  let(:user) { create(:user) }


  context "On users profile page" do

    before do
      login_as(user, :scope => :user)
      visit "/users/#{user.id}"
    end

    it "has a welcome message" do
      expect(page).to have_content("Hello, swap@clothes.com")
    end

    it "has a link to my wardrobe" do
      click_link("My Wardrobe")
      expect(current_path).to eq ("/users/#{user.id}/wardrobe")
    end

    it "has a back link" do
      click_link("Back")
      expect(current_path).to eq ("/")
    end

  end


end
