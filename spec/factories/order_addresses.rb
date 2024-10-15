FactoryBot.define do
  factory :order_address do
    post_cord        { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    city             { Faker::Address.city }
    address_num      { Faker::Address.street_address }
    building         { Faker::Company.name }
    phone_num        { Faker::Number.leading_zero_number(digits: 11) }
    token            { Faker::Alphanumeric.alphanumeric(number: 30) }

    association :user
    association :item
  end
end
