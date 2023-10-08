FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    nickname {Faker::Name.initials}
    birth_date {Faker::Date.birthday}
    last_name {"山田"}
    first_name {"隆太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"リクタロウ"}
  end
end