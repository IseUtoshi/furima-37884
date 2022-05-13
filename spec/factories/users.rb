FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    katakana_first_name
    katakana_last_name
    birthday
  end
end
