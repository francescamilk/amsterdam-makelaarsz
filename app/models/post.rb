class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :summary, presence: true
  validates :body, presence: true
  validates :photo, presence: true

  has_one_attached :photo
  has_rich_text :rich_body
end
