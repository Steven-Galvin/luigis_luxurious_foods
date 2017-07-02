class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :info, :cost, :origin, presence: true
  validates :name, length: { in: 2..25 }
  validates :info, length: { in: 25..150 }
  validates :cost, numericality: { greater_than: 0 }

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :made_in_usa, -> { where(origin: "United States of America")}
  scope :most_reviewed, -> {(
    select("products.id, products.name, products.info, products.cost, products.origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
end
