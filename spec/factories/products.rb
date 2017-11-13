FactoryBot.define do
  factory :product do
    sequence(:mane) { |n| "Product numbeer #{n}" }
    brand "Acme"
    model "m"
    sku "K123"
    price 10.04
    descr "Description of the product"
  end
end
