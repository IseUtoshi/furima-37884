FactoryBot.define do
  factory :purchase_delivery_address do
    Faker::Config.locale = 'ja'
    token            { "tok_#{Faker::Lorem.characters(number: 28)}" }
    postcode         { Faker::Address.postcode }
    building         { Faker::Address.building_number }
    house_number     { Faker::Address.street_address }
    municipality     { Faker::Address.city }
    prefecture_id    { Faker::Number.within(range: 2..48) }
    telephone_number { Faker::Number.leading_zero_number(digits: 10) }
  end
end
