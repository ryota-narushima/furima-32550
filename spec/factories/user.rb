FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_j           {Gimei.last.kanji}
    first_name_j          {Gimei.first.kanji}
    last_name_k           {Gimei.last.katakana}
    first_name_k          {Gimei.first.katakana}
    birth_day             {2000-01-01}
  end
end