require 'rails_helper'

describe "Item" do

  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "testthisthing@test.com", id: '101') }

  before do
    login_as(user, :scope => :user)
  end

  context "no items have been added" do
    scenario "should display a prompt to add an item" do
      visit '/items'
      expect(page).to have_content 'No items yet'
      expect(page).to have_link 'Add an item' ## this is just in the navbar
    end
  end

  context 'items have been added' do
    before(:each) do
      @new_image = create(:item, user_id: user.id, id: 5)
      @new_image.save
    end

    it 'should display items' do
      visit '/items'
      expect(page).to have_css("img[src*='pokemon_onesie.jpg']")
      expect(page).not_to have_content 'No items yet'
    end

    it 'clicking a photo allows a user to see that item' do
      visit '/'
      expect(page).to have_css("img[src*='pokemon_onesie.jpg']")
      click_on('Pokemon onesie')
      expect(current_path).to eq "/items/#{@new_image.id}"
      expect(page).to have_content 'Pokemon onesie'
    end

    it 'should not allow another user to edit a particular item' do
      sign_out
      visit('/')
      login_as(user_2, :scope => :user)
      visit('/')
      expect(page).not_to have_content('Edit')
      expect(page).not_to have_content('Destroy')
    end

    it 'should allow a user to delete his own item' do
      visit ('/items')
      click_on('Pokemon onesie')
      click_link('Destroy')
      expect(page).to have_content("Item was successfully destroyed")
      expect(page).not_to have_content("Best beast for best Halloween")
    end

  end

  context 'adding an item (without image)' do
    it 'should prompt user to fill out a form, then displays the new item' do
      visit '/items'
      click_link 'Add an item'
      fill_in('Description', with: 'Best beast for best Halloween')
      fill_in('Size', with: 'M')
      fill_in('Color', with: 'Red')
      fill_in('Category', with: 'Costume')
      click_button('Create Item')
      expect(page).to have_content 'Item was successfully created'
      expect(current_path).to eq "/items"
    end
  end

end
