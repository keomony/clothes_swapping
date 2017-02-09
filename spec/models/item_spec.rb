require 'rails_helper'

describe Item, type: :model do
  context "associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :selectors }
  end

  context "validations" do
    let(:user) {create(:user)}
    subject(:item) {
      create(:item, user_id: user.id)
    }

    it "is not valid without a description" do
       item[:description] = nil
      expect(item).to_not be_valid
    end
    it "is not valid without a color" do
      item[:color] = nil
      expect(item).not_to be_valid
    end
    it "is not valid without a category" do
      item[:category] = nil
      expect(item).not_to be_valid
    end
    it "is not valid without a size" do
      item[:size] = nil
      expect(item).not_to be_valid
    end

    it "is not valid without an image" do

      expect{item[:image] = nil}.to raise_error(NameError)
    end
  end
end
