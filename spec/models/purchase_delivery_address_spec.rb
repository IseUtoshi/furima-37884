require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: item.user_id, item_id: item.id)
  end
  describe '購入時のデータ保存処理' do
    context '保存できる場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_delivery_address).to be_valid
      end
      it '建物名は空でも保存できる' do
        @purchase_delivery_address.building = ''
        expect(@purchase_delivery_address).to be_valid
      end
    end
    context '保存できない場合' do
      it 'トークンを獲得できていない' do
        @purchase_delivery_address.token = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("クレジットカード情報に誤りがあります")
      end
      it '郵便番号が空' do
        @purchase_delivery_address.postcode = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号が「3桁ハイフン4桁」の形式でない' do
        @purchase_delivery_address.postcode = '3334444'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('郵便番号にはハイフンを含めてください')
      end
      it '都道府県が選択されていない' do
        @purchase_delivery_address.prefecture_id = '1'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村が空' do
        @purchase_delivery_address.municipality = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空' do
        @purchase_delivery_address.house_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空' do
        @purchase_delivery_address.telephone_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号の桁数が9桁以下' do
        @purchase_delivery_address.telephone_number = '0901234'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('電話番号は10~11桁の半角数字のみで記載してください')
      end
      it '電話番号の桁数が11桁以上' do
        @purchase_delivery_address.telephone_number = '090123456789'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('電話番号は10~11桁の半角数字のみで記載してください')
      end
      it '電話番号が数値のみでない' do
        @purchase_delivery_address.telephone_number = '090-1234-5678'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('電話番号は10~11桁の半角数字のみで記載してください')
      end
      it 'ユーザーが紐づいていない' do
        @purchase_delivery_address.user_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("ユーザーが存在しません")
      end
      it '商品が紐づいていない' do
        @purchase_delivery_address.item_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("商品が存在しません")
      end
    end
  end
end
