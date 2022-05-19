FactoryBot.define do
  factory :purchase_delivery_address do
    transient do
      person { Gimei.name }
    end
    postcode         { Faker::Commerce.material }
    building         { Faker::Commerce.material }
    house_number     { Faker::Commerce.material }
    municipality     { Faker::Commerce.material }
    prefecture_id    { Faker::Number.within(range: 2..48) }
    telephone_number { Faker::Commerce.material }
    association :user
    association :item
  end
end
