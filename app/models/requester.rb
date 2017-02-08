class Requester < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :selector
  validates :item, :uniqueness => {:scope => :user}
end
