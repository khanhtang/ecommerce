FactoryBot.define do
  factory :order do
    status {rand(0..3)}
    total_of_money {rand(1000000..9999999)}
  end
end
