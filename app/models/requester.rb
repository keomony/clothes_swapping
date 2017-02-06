class Requester < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :user, uniqueness: { scope: :item, message: "You already requested this item" }
end
