User.create!(
  email: "a2suisei0@gmail.com",
  name: "Tang Ngoc Khanh",
  phone: "1111111111",
  address: "caugiayhanoivietnamdadasd1214124",
  role: 1,
  password: "111111",
  password_confirmation: "111111",
  is_active: true
)

30.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "foobar"
    password_confirmation = "foobar"
    phone = Faker::PhoneNumber.cell_phone
    address = Faker::Address.street_address
    User.create!(
      name: name, 
      email: email, 
      phone: phone, 
      address: address, 
      role: 0, 
      password: password, 
      password_confirmation: password_confirmation, 
      is_active: true
    )
end

5.times do |n|
  name = %w[Dell MSI Asus Acer Macbook HP].sample
  parent_id = 1
  Category.create!(
    name: name,
    parent_id: parent_id
  )
end

5.times do |n|
  name = %w[Laptop Desktop Network-equipment Gaming-chair Computer-components].sample
  Category.create!(
    name: name,
    parent_id: nil
  )
end

30.times do |n|
  name = Faker::Commerce.product_name
  price = 200000
  residual = 100
  description = Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4)
  category_id = rand(1..5)
  Product.create!(
    name: name,
    price: price,
    residual: residual,
    description: description,
    category_id: category_id
  )
end

5.times do |n|
  status = rand(0..1)
  total_of_money = 222222
  user_id = 1
  Order.create!(
    status: status,
    total_of_money: total_of_money,
    user_id: user_id
  )
end

30.times do |n|
  status = rand(0..3)
  total_of_money = 222222
  user_id = rand(1..20)
  Order.create!(
    status: status,
    total_of_money: total_of_money,
    user_id: user_id
  )
end

30.times do |n|
  quantity = rand(1..3)
  price = 200000
  order_id = rand(1..20)
  product_id = rand(1..20)
  OrderDetail.create!(
    quantity: quantity,
    price: price,
    order_id: order_id,
    product_id: product_id
  )
end
