class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments, through: :users
  has_many :skills, through: :projects_skills
end
