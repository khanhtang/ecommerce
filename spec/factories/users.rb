FactoryBot.define do
  factory :user do
    name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    email {Faker::Internet.email}
    role {rand(User.roles.values.first..User.roles.values.last)}
    phone {Faker::PhoneNumber.cell_phone}
    address {Faker::Address.street_address}
    is_active {1}
    password {"111111"}
    password_confirmation {"111111"}
  end
end
