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
        expect(@purchase_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空' do
        @purchase_delivery_address.postcode = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の形式でない' do
        @purchase_delivery_address.postcode = '3334444'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Postcode にはハイフンを含めてください')
      end
      it '都道府県が選択されていない' do
        @purchase_delivery_address.prefecture_id = '1'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空' do
        @purchase_delivery_address.municipality = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空' do
        @purchase_delivery_address.house_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空' do
        @purchase_delivery_address.telephone_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号の桁数が10-11桁でない' do
        @purchase_delivery_address.telephone_number = '0901234'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Telephone number は10~11桁の数字のみで記載してください')
      end
      it '電話番号が数値のみでない' do
        @purchase_delivery_address.telephone_number = '090-1234-5678'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Telephone number は10~11桁の数字のみで記載してください')
      end
      it 'ユーザーが紐づいていない' do
        @purchase_delivery_address.user_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐づいていない' do
        @purchase_delivery_address.item_id = nil
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
