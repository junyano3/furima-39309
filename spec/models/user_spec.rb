require 'rails_helper'

RSpec.describe User, type: :model do
  before do
     @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_kana,last_name_kana,date_of_birth,が存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordは数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordは全角では登録できない'do
        @user.password = 'ｚｚｚｚｚｚ'
        @user.password_confirmation = 'ｚｚｚｚｚｚ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

it 'お名前(全角)は、名字last_nameが空では登録できない' do
  @user.last_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include( "Last name can't be blank", 'Last name 全角文字を使用してください' )
end
it 'お名前(全角)は、名前first_nameが空では登録できない' do
@user.first_name = ''
@user.valid?
expect(@user.errors.full_messages).to include( "First name can't be blank", 'First name 全角文字を使用してください' )
end

it 'お名前(全角)は、名字last_nameが、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
@user.last_name = 'ss'
@user.valid?
  expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
end

it 'お名前(全角)は、名前first_nameが、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
  @user.first_name = 'ss'
  @user.valid?
  expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
end


it 'お名前カナ(全角)は、名字last_name_kanaが空だと登録できない' do
  @user.last_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カナ文字を使用してください")
  end

it 'お名前カナ(全角)は、名前first_name_kanaが空だと登録できない' do
  @user.first_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カナ文字を使用してください")
end
it 'お名前カナ(全角)は、名字last_name_kanaが全角（カタカナ）でないと登録できない' do
  @user.last_name_kana = 'あ'
  @user.valid?
  expect(@user.errors.full_messages).to include('Last name kana 全角カナ文字を使用してください')
end

it 'お名前カナ(全角)は、名字last_name_kanaが全角（カタカナ）でないと登録できない' do
@user.first_name_kana = 'あ'
@user.valid?
expect(@user.errors.full_messages).to include( 'First name kana 全角カナ文字を使用してください' )
end

it '生年月日が必須であること。' do
  @user.date_of_birth = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Date of birth can't be blank")
end


end
end
end