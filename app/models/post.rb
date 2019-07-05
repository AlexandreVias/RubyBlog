class Post < ApplicationRecord
  mount_uploader :img, PhotoUploader
  belongs_to :user
end
