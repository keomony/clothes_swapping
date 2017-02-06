class Item < ApplicationRecord
  has_attached_file :image,
    :styles => { :medium => "400x400>", :thumb => "100x100>", :square => "300x300#" }, default_url: "/images/:style/missing.png"
  validates_presence_of(:description, :color, :category, :size, :image)
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  #association
  belongs_to :user
  has_many :requesters

end
