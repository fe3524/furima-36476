require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '商品出品機能' do
    context '出品登録できる場合' do
      it '商品情報がデータベースに保存される' do
        expect(@item).to be_valid
      end
    end

    context '出品登録できない場合' do
      it '商品画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がなければ出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品説明がなければ出品できない' do
      end

      it 'カテゴリーの情報がなければ出品できない' do
      end
      
      it '商品状態の情報がなければ出品できない' do
      end

      it '配送料負担の情報がなければ出品できない' do
      end

      it '発送元地域の情報がなければ出品できない' do
      end

      it '発送までの日数の情報がなければ出品できない' do
      end

      it '価格の情報がなければ出品できない' do
      end

      it '価格は制限値内でなければ出品できない' do
      end

      it '価格は半角数字での入力でなければ出品できない' do
      end
    end
  end
end
