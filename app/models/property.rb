class Property < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :rooms, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true

  belongs_to :account
  has_many_attached :photo
end
