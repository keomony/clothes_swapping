require 'rails_helper'

describe "Swap" do

  let(:user_1) { create(:user) }
  let(:user_2) { create(:user, email: "testthisthing@test.com", id: '101') }

  let(:item_1) {create(:item, user_id: user_1.id, id: '200')}
  let(:item_2) {create(:item, user_id: user_2.id, color: 'blue', description: "Squirtle Onesie", id: "201")}


  subject(:request) { item_1.requesters.create(item_id: item_1.id, user_id: user_2.id) }
  subject(:selectee) { request.selector.create(item_id: item_2.id, user_id: user_1.id, requester_id: request.id ) }

  scenario "build a selector" do
    expect(selectee).to be_a(Selector)
  end

  scenario "" do
  end
end
