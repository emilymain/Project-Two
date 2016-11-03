class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :skills
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles:{
    small: "64x64",
    med: "100x100",
    large: "200x200"
  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
