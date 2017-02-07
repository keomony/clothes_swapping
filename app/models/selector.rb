class Selector < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :requester
end
