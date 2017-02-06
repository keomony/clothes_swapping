require 'rails_helper'

describe 'Index' do

  let(:user) {create(:user)}

  before do
    login_as(user, :scope => :user)
  end

  context "User cannot see an item that they have added" do

    before(:each) do
      @new_image = create(:item, user_id: user.id, id: 5)
      @new_image.save
    end


    scenario 'on the index page' do
      visit '/items'
      expect(page).not_to have_css("img[src*='pokemon_onesie.jpg']")
      expect(page).to have_content 'No items yet'
    end
  end
end
