FactoryBot.define do
    factory :user do
    email {Faker::Internet.free_email}
    password {'aaa111'}
    password_confirmation {password}
    nickname {Faker::Name}
    last_name {'山田'}
    first_name {'太郎'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birth_date {Faker::Date.backward}
    
    end
    end
    