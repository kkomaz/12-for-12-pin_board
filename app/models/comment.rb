class Comment < ActiveRecord::Base
  belongs_to :pin
  belongs_to :user 
  validates :content, presence: true
end