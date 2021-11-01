require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '商品購入' do
    context '商品が購入できる場合' do
      it '必要な情報を適切に入力していればDBへ保存ができる' do
      end

      it '建物名は空欄でも保存できる' do
      end
      
      it '電話番号は10桁以上11桁以内であれば保存できる'
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空では登録できない' do
      end
      
      it 'user情報がなければ登録できない' do
      end

      it 'item情報がなければ登録できない' do
      end

      it '郵便番号がなければ登録できない' do
      end

      it '郵便番号にハイフンがなければ登録できない' do
      end

      it '郵便番号は半角文字列でなければ登録できない' do
      end

      it '都道府県が選択されていなければ登録できない' do
      end

      it '市区町村の情報がなければ登録できない' do
      end

      it '番地の情報がなければ登録できない' do
      end

      it '電話番号の情報がなければ登録できない' do
      end

      it '電話番号が10桁以下では登録できない' do
      end

      it '電話番号が12桁以上では登録できない' do
      end

      it '電話番号にハイフンがあると登録できない' do
      end

      it '電話番号は半角数字でなければ登録できない' do
      end
    end
  end
end
