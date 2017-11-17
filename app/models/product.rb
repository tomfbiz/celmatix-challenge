# +Product+ active record
class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  has_and_belongs_to_many :carts
end
