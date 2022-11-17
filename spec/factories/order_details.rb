FactoryBot.define do
  factory :order_detail do
    quantity {rand(1..100)}
    price {rand(000000..9999999)}
    product {FactoryBot.create(:product)}
    order {FactoryBot.create(:order)}
  end
end
