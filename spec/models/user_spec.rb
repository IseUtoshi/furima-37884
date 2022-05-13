require 'rails_helper'

RSpec.describe User, type: :model do

  before do
  @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "必須項目が、バリデーションに干渉せずに入力されている" do
      end
    end
    context '新規登録できない場合' do
      it "ニックネームが空では登録できない" do
      end
      it "メールアドレスが空では登録できない" do
      end
      it "メールアドレスが既に登録されているものと同じでは登録できない" do
      end
      it "メールアドレスに@が含まれていなければ登録できない" do
      end
      it "パスワードが空では登録できない" do
      end
      it "パスワードが6文字未満では登録できない" do
      end
      it "パスワードが英数字混合でなければ登録できない" do
      end
      it "パスワードと確認用パスワードが不一致だと登録できない" do
      end
      it "名前が空では登録できない" do
      end
      it "苗字が空では登録できない" do
      end
      it "名前が全角文字でないと登録できない" do
      end
      it "苗字が全角文字でないと登録できない" do
      end
      it "名前（カナ）が空では登録できない" do
      end
      it "苗字（カナ）が空では登録できない" do
      end
      it "名前（カナ）が全角カタカナでないと登録できない" do
      end
      it "苗字（カナ）が全角カタカナでないと登録できない" do
      end
      it "生年月日が空だと登録できない" do
      end
    end
  end
end
