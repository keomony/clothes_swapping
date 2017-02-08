class Swap < ApplicationRecord
  has_one :requester
  has_one :selector

end
