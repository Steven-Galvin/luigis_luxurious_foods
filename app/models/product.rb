class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :info, :cost, :origin, presence: true
  validates :name, length: { in: 2..25 }
  validates :info, length: { in: 25..150 }
end
