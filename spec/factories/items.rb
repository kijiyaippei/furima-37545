FactoryBot.define do
  factory :item do
   
    item_name {Faker::Lorem.sentence}
    item_info {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    shipping_id {2}
    prefecture_id {2}
    delivery_id {2}
    item_price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample1.png'), filename: 'sample1.png')
    end
    
    after(:create) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample1.png'), filename: 'sample1.png')
    end
end
end

