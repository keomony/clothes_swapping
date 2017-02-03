require 'rails_helper'

describe "Request" do

  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "testthisthing@test.com", id: '101') }

  before do
    login_as(user, :scope => :user)
    new_image = create(:item, user_id: user.id)
    sign_out
    login_as(user_2, :scope => :user)
  end

  scenario "user has uploaded and item" do
    visit '/'
    expect(page).to have_content "Pokemon onesie"
  end
end
