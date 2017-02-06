class Item < ApplicationRecord

  has_attached_file :image,
    :styles => { :medium => "400x400>", :thumb => "100x100>", :square => "300x300#" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  has_many :requesters,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

end
