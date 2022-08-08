class Order < ApplicationRecord

belongs_to :user
#attr_accessor :token

has_one :address
belongs_to :item
end

