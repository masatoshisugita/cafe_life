class Topic < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }
  has_many :maps
end
