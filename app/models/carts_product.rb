# +CartsProduct+ active record
class CartsProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
