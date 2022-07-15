class Address < ApplicationRecord
#belongs_to :order
#belongs_to :prefecture
#validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
#validates :prefecture, presence: true, exclusion: {in: ['---']}
#validates :city, presence: true
#validates :addresses, presence: true
#validates :phone_number, presence: true

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :prefecture

end
 