require 'rails_helper'

describe Requester, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :item }
  it { is_expected.to have_one :selector}
end
