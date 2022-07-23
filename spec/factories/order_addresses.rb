FactoryBot.define do
  factory :order_address do
    addresses {'1番地'}
    city {Faker::Lorem.sentence}
    postal_code {'000-0000'}
    phone_number {'0000000000'}
    token {'tok_abcdefghijk00000000000000000'}
    prefecture_id {2}
    building {'test'}
 
  end
end
