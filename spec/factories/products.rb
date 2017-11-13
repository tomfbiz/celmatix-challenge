FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product numbeer #{n}" }
    brand "Acme"
    model "m"
    sku "K123"
    price 10.04
    desc "Description of the product"
  end
end
