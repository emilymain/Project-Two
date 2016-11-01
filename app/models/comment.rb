class Comment < ApplicationRecord
  belongs_to :projects , through: :users 
end
