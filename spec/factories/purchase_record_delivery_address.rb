FactoryBot.define do
  factory :purchase_record_delivery_address do

    token {"tok_abcdefghijk00000000000000000"}
    postal_code                          { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id                        { Faker::Number.between(from: 2, to: 48) }
    city_town                            { Faker::Address.city }
    street_number                        { Faker::Address.building_number }
    building_name                        { Faker::Address.secondary_address }
    phone_number                         { Faker::Number.unique.number(digits: [10, 11].sample) }
   
  end
end
