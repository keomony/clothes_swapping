require 'rails_helper'

describe "profile page" do

  let(:user) { create(:user) }


  context "On users profile page" do

    before do
      login_as(user, :scope => :user)
      visit "/users/#{user.id}"
    end

    it "has profile page" do
      expect(page).to have_content("Hello swap@clothes.com")
    end

  end


end
