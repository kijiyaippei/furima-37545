require 'rails_helper'

RSpec.describe Item, type: :model do

describe '商品の登録' do
  before do
user = FactoryBot.create(:user)
@item = FactoryBot.build(:item, user_id: user.id)
end

context '内容に問題ない場合' do
it '必要情報を入力すると登録できる' do
expect(@item).to be_valid
end
end

context '内容に問題ある場合' do
it '商品画像が必要' do
@item.image = nil
@item.valid?
expect(@item.errors.full_messages).to include("Image can't be blank")
end
it '商品名が必要' do
  @item.item_name = ''
  @item.valid?
expect(@item.errors.full_messages).to include("Item name can't be blank")
end
it 'カテゴリーを選択していないと保存できない' do
  @item.category_id = 1
  @item.valid?
expect(@item.errors.full_messages).to include("Category can't be blank")
end
it '商品状態を選択していないと保存できない' do
  @item.status_id = 1
  @item.valid?
expect(@item.errors.full_messages).to include("Status can't be blank")
end
it '配送料の負担を選択していないと保存できない' do
  @item.shipping_id = 1
  @item.valid?
expect(@item.errors.full_messages).to include("Shipping can't be blank")
end
it '配送地域を選択していないと保存できない' do
  @item.prefecture_id = 1
  @item.valid?
expect(@item.errors.full_messages).to include("Prefecture can't be blank")
end
it '配送日数を選択していないと保存できない' do
  @item.delivery_id = 1
  @item.valid?
expect(@item.errors.full_messages).to include("Delivery can't be blank")
end
it '価格は半角数値である必要がある' do
  @item.item_price = 'あ'
  @item.valid?
expect(@item.errors.full_messages).to include("Item price is not a number")
end
it '価格は300円未満であると登録できない' do
  @item.item_price = '100'
  @item.valid?
expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
end
it '価格は9999999円より高いと登録できない' do
  @item.item_price = '10000000'
  @item.valid?
expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
end
it '価格は半角数値である必要がある' do
  @item.item_price = 'aaa'
  @item.valid?
expect(@item.errors.full_messages).to include("Item price is not a number")
end
it 'user_idが紐ついている必要ある' do
  @item.user_id = nil
  @item.valid?
expect(@item.errors.full_messages).to include("User must exist")
end
end
end
end