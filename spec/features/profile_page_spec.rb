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
      expect(current_path).to eq ("/users/#{user.id}/profile/wardrobe")
    end

    it "has a back link" do
      click_link("Back")
      expect(current_path).to eq ("/")
    end

    it "has an edit user account link" do
      click_link("Edit Account")
      expect(current_path).to eq ("/users/edit")
    end

    # Revise after requests model is created

    # it "has a my requests link" do
    #   click_link("My Requests")
    #   expect(current_path).to eq ("/users/requests")
    # end


  end


end
