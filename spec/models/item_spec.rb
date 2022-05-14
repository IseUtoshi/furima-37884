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
      end
      it '商品状態の情報がない' do
      end
      it '配送料の負担の情報がない' do
      end
      it '発送元地域の情報がない' do
      end
      it '発送までの日数の情報がない' do
      end
      it '価格の情報がない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が安すぎる' do
      end
      it '価格が高すぎる' do
      end
      it '価格が半角数値でない' do
      end
      it 'userが紐付いていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
