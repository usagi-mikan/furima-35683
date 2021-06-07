FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code { '123-4567' }
    prefecture_id {2}
    city {Faker::Lorem.sentence}
    house_number {Faker::Lorem.sentence}
    building_name {Faker::Lorem.sentence}
    telephone { '09012345678' }
    association :user 
    association :item
  end
end
