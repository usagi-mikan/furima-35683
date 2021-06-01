FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    catch_copy {Faker::Lorem.sentence}
    concept_category_id {2}
    concept_status_id {2}
    delivery_charge_id {2}
    delivery_area_id {2}
    delivery_day_id {2}
    price {300}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
