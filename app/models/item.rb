class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_one :order
    
    validates :image, presence: true
    validates :item_name, presence: true 
    validates :item_info, presence: true
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :item_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :shipping
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery
  end
