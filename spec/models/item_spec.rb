require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品投稿' do
    context '商品が出品できる場合' do
      it '必須項目がバリデーション干渉せずに入力されている' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が添付されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空である' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空である' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'カテゴリーの情報がない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態の情報がない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報がない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元地域の情報がない' do
        @item.delivery_from_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery from can't be blank")
      end
      it '発送までの日数の情報がない' do
        @item.delivery_duration_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery duration can't be blank")
      end
      it '価格の情報がない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上1000万未満の半角整数にしてください')
      end
      it '価格が1000万円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上1000万未満の半角整数にしてください')
      end
      it '価格が半角数値でない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上1000万未満の半角整数にしてください')
      end
      it '価格が整数でない' do
        @item.price = '350.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上1000万未満の半角整数にしてください')
      end
      it 'userが紐付いていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
