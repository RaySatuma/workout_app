class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :youtube_url, presence: true,
  format: { with: /\A(https\:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)+[\S]{11}\z/ }

end
