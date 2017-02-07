require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :items }
  it { is_expected.to have_many :requesters }
  it { is_expected.to have_many :selectors }
end
