require 'rails_helper'

describe Selector, type: :model do
  it {is_expected.to belong_to :user}
  it {is_expected.to belong_to :item}
  it {is_expected.to belongs_to :requester}
end
