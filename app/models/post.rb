class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :summary, presence: true
  validates :body, presence: true
  validates :image, presence: true, uniqueness: true
end
