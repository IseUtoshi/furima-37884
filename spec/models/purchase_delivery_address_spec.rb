require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: item.user_id, item_id: item.id)
  end
  describe '購入時のデータ保存処理' do
    context '保存できる場合' do
      it "全ての値が正しく入力されていれば保存できる" do
      end
      it "建物名は空でも保存できる" do
      end
    end
    context '保存できない場合' do
      it "クレジットカード情報が正しくなく、トークンを獲得できていない" do
      end
      it "郵便番号が空" do
      end
      it "郵便番号が「3桁ハイフン4桁」の形式でない" do
      end
      it "都道府県が選択されていない" do
      end
      it "市区町村が空" do
      end
      it "番地が空" do
      end
      it "電話番号が空" do
      end
      it "電話番号の桁数が10-11桁でない" do
      end
      it "電話番号が数値のみでない" do
      end
      it "ユーザーが紐づいていない" do
      end
      it "商品が紐づいていない" do
      end
    end
  end
end
