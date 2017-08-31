class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
validates :photo, :description, :user_id, presence: true
has_many :comments
end
