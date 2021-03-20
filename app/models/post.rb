class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :comments
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 30 }
end
