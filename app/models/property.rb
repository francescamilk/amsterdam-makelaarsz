class Property < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :rooms, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
  validates :neighborhood, presence: true
  validates :description, presence: true
  validates :photos, presence: true

  belongs_to :account

  has_many_attached :photos

  scope :latest, -> { order created_at: :desc }

  scope :for_sale, -> { where for_sale: true }
  scope :for_rent, -> { where for_sale: false }
  scope :sold, -> { where sold: true }
  scope :leased, -> { where leased: true }

  scope :filter_by_price, -> (min, max) { where('price > ? AND price < ?', min, max) }
  scope :filter_by_rooms, -> (min, max) { where('rooms > ? AND rooms < ?', min, max) }

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name, :address ],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :search_by_neighborhood,
  against: [ :neighborhood, :neighborhood_text ],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :search_by_price,
  against: [ :price ],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :search_by_amenities,
  against: [ :rooms, :bedrooms, :bathrooms ],
  using: {
    tsearch: { prefix: true }
  }
end
