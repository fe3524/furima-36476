require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録ができる場合' do
      it '必要事項が全て入力されている場合' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456tu'
        @user.password_confirmation = '123456tu'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含んでいなければ登録できない' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上でなければ登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英字のみでは登録できない' do
        @user.password = 'testestes'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end

      it 'パスワードは、数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end

      it 'パスワードは、全角では登録できない' do
        @user.password = 'ＴＥＳＴＴＥＳＴＥＳ２２２２'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end

      it 'パスワードとパスワード（確認）は、値が一致していなければ登録できない' do
        @user.password = '123456tu'
        @user.password_confirmation = '123457tu'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'test_user'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'お名前カナ(全角)は、名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'お名前カナ(全角)の名字は、全角（カタカナ）での入力が必須であること。' do
        @user.last_name_kana = 'ｳﾁﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'お名前カナ(全角)の名前は、全角（カタカナ）での入力が必須であること。' do
        @user.first_name_kana = 'ﾀﾂﾔ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it '生年月日が必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

  describe 'ログイン' do
    context 'ログインができる場合' do
      it '入力項目が正しいときログインできる' do
        expect(@user).to be_valid
      end
    end

    context 'ログインできない場合' do
      it 'メールアドレスが正しくない場合はログイン出来ないこと' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが正しくない場合はログイン出来ないこと' do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
