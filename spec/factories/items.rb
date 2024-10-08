FactoryBot.define do
  factory :item do
    name              { Faker::Name }
    explanation       { Faker::Lorem.sentence }
    price             { Faker::Number.between(from: 300, to: 99_999_99) }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    postage_id        { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    how_long_id       { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
