class OrderAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :token, :user_id, :order_id
    
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city, presence: true
    validates :addresses, presence: true
    validates :phone_number, presence: true, numericality: {only_integer: true}, length: { in: 10..11 }
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :token, presence: true
   

def save
    order = Order.create(item_id: item_id, user_id: user_id, token: token)
    #order = Order.create(token: token)
Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
end
end
