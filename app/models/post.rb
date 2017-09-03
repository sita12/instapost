class Post < ApplicationRecord
   belongs_to :user
  has_many :comments, dependent: :destroy
  
  mount_uploader :photo, PhotoUploader
    delegate :photo, :name, to: :user, prefix: true  

  validates :photo, :description, :user_id, presence: true

  acts_as_votable

end
