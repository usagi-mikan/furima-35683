FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {Gimei.last.kanji}
    first_name {Gimei.first.kanji}
    last_name_reading {Gimei.last.katakana}
    first_name_reading {Gimei.first.katakana}
    birthday {Faker::Date.backward}
  end
end