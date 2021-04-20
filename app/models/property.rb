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

  include PgSearch::Model
  pg_search_scope :search_by_params,
  against: [ :address, :neighborhood, :neighborhood_text, :price, :rooms, :bedrooms, :bathrooms ],
  using: {
    tsearch: { prefix: true }
  }
end
