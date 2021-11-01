require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @form = FactoryBot.build(:form, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品が購入できる場合' do
      it '必要な情報を適切に入力していればDBへ保存ができる' do
        expect(@form).to be_valid
      end

      it '建物名は空欄でも保存できる' do
        @form.building = ''
        expect(@form).to be_valid
      end

      it '電話番号は10桁以上11桁以内であれば保存できる' do
        @form.phone_number = '0123456789'
        expect(@form).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空では登録できない' do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user情報がなければ登録できない' do
        @form.user_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end

      it 'item情報がなければ登録できない' do
        @form.item_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号がなければ登録できない' do
        @form.zipcode =  ''
        @form.valid?
        expect(@form.errors.full_messages).to include('Zipcode is invalid. Include hyphen(-)')
      end

      it '郵便番号にハイフンがなければ登録できない' do
        @form.zipcode = '1111111 '
        @form.valid?
        expect(@form.errors.full_messages).to include('Zipcode is invalid. Include hyphen(-)')
      end

      it '郵便番号は半角文字列でなければ登録できない' do
        @form.zipcode = '３３３−３３３３'
        @form.valid?
        expect(@form.errors.full_messages).to include('Zipcode is invalid. Include hyphen(-)')
      end

      it '都道府県が選択されていなければ登録できない' do
        @form.state_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include('State must be other than 1')
      end

      it '市区町村の情報がなければ登録できない' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end

      it '番地の情報がなければ登録できない' do
        @form.address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号の情報がなければ登録できない' do
        @form.phone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁以下では登録できない' do
        @form.phone_number = '012345678'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上では登録できない' do
        @form.phone_number = '012345678901'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号にハイフンがあると登録できない' do
        @form.phone_number = '012-3456-7890'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は半角数字でなければ登録できない' do
        @form.phone_number = '１２３４５６７８９０１'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
