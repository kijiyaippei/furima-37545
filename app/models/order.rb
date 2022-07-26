class Order < ApplicationRecord

belongs_to :user
attr_accessor :token
#validates :token, presene: true
has_one :address
belongs_to :item
end

