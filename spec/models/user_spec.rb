require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'ユーザー新規登録' do
  before do
  @user = FactoryBot.build(:user)
end
context '内容に問題ない場合' do
it '必要情報を入力すると登録できる' do
expect(@user).to be_valid
end
end

context '内容に問題ある場合' do
it 'nicknameがないと登録できない' do
@user.nickname = ''
@user.valid?
expect(@user.errors.full_messages).to include("Nickname can't be blank")
end
it 'emailがないと登録できない' do
@user.email = ''
@user.valid?
expect(@user.errors.full_messages).to include("Email can't be blank")
end
it 'passwordがないと登録できない' do
  @user.password = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
end
it 'last_nameは全角でないと登録できない' do
  @user.last_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name is invalid")
end
it 'first_nameは全角でないと登録できない' do
  @user.first_name = 'a'
  @user.valid?
  expect(@user.errors.full_messages).to include("First name is invalid")
end
it 'last_name_kanaは全角でないと登録できない' do
  @user.last_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana is invalid")
end
it 'first_name_kanaは全角でないと登録できない' do
  @user.first_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana is invalid")
end
it 'birth_dateがないと登録できない' do
  @user.birth_date = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Birth date can't be blank")
end
it 'emailが一意性がある' do
  @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include('Email has already been taken')
end
it 'emailは@を含む必要がある' do
@user.email = 'testmail'
@user.valid?
expect(@user.errors.full_messages).to include('Email is invalid')
end
it 'passwordは5文字以下では登録できない' do
  @user.password = 'aa000'
  @user.password_confirmation = 'aa000'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
end
it 'passwordとpassword_confirmationは不一致では登録できない' do
@user.password = 'a123456'
@user.password_confirmation = 'a1234567'
@user.valid?
expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end
it 'passwordは半角数字のみでは登録できない' do
  @user.password = '111111'
  @user.password_confirmation = '111111'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is invalid")
end
it 'passwordは半角英字のみでは登録できない' do
  @user.password = 'aaaaaa'
  @user.password_confirmation = 'aaaaaa'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is invalid")
end

it 'last_nameは全角日本語以外では登録できない' do
@user.last_name = 'test'
@user.valid? 
expect(@user.errors.full_messages).to include("Last name is invalid")
end

it 'first_nameは全角日本語以外では登録できない' do
  @user.first_name = 'a'
  @user.valid?
  expect(@user.errors.full_messages).to include("First name is invalid")
end

it 'last_name_kanaは英字以外では登録できない' do
  @user.last_name_kana = 'あ'
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana is invalid")
end

it 'first_name_kanaは英字以外では登録できない' do
  @user.first_name_kana = 'あ'
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana is invalid")
end
end
end
end
