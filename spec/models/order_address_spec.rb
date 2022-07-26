require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

describe '商品の購入' do
before do
user = FactoryBot.create(:user)
item = FactoryBot.create(:item)
@order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
sleep 1.0
end   
context '内容に問題ない場合' do
it '必要情報を入力すると登録できる' do
expect(@order_address).to be_valid
end
it '建物情報がなくとも登録できる' do
@order_address.building = ''
@order_address.valid?
end
end
context '内容に問題ある場合' do
it 'tokenがないと登録できない' do
@order_address.token = ''
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Token can't be blank")
end
it '郵便番号が必要である' do
@order_address.postal_code = ''
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
end
it '郵便番号は3桁-4桁である必要がある' do
@order_address.postal_code = '00-000'
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Postal code is invalid")
end
it '都道府県はカテゴリーを選択する必要がある' do
@order_address.prefecture_id = 1
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
end
it '市区町村が必要がある' do
@order_address.city = ''
@order_address.valid?
expect(@order_address.errors.full_messages).to include("City can't be blank")
end
it '番地が必要がある' do
@order_address.addresses = ''
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
end
it '電話番号が必要がある' do
@order_address.phone_number = ''
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
end 
it '電話番号が9桁だと登録できない' do
@order_address.phone_number = '000000000'
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
end 
it '電話番号が12桁だと登録できない' do
@order_address.phone_number = '000000000000'
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
end 
it '郵便番号はハイフンを含む必要がある' do
  @order_address.postal_code = '0000000'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Postal code is invalid")
  end 
it '電話番号に半角数値以外が含まれる場合は登録できない' do
    @order_address.phone_number = 'a0000000000'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is not a number")
    end 
it 'user_idと紐つく必要がある' do
@order_address.user_id = nil
@order_address.valid?
expect(@order_address.errors.full_messages).to include("User can't be blank")
end   
it 'item_idと紐つく必要がある' do
@order_address.item_id = nil
@order_address.valid?
expect(@order_address.errors.full_messages).to include("Item can't be blank")
end  
end
end
end