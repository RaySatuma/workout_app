class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :comments
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 30 }
end
