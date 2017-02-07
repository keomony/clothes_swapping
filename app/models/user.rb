class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items, dependent: :destroy
  has_many :requesters, dependent: :destroy

  # has_many :requested_items, through: :requesters, source: :item
  #
  # def has_requested?(item)
  #   requested_items.include? item
  # end
end
