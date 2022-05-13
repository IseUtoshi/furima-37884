require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必須項目が、バリデーションに干渉せずに入力されている' do
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
      it 'メールアドレスが既に登録されているものと同じでは登録できない' do
        another_user = FactoryBot.build(:user)
        another_user.save
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@が含まれていなければ登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英字のみでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む半角文字で設定してください')
      end
      it 'パスワードが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む半角文字で設定してください')
      end
      it 'パスワードが全角では登録できない' do
        @user.password = 'ｔｅｓｔ１２３４'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む半角文字で設定してください')
      end
      it 'パスワードと確認用パスワードが不一致だと登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前が全角文字でないと登録できない' do
        @user.first_name = 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
      end
      it '苗字が全角文字でないと登録できない' do
        @user.last_name = 'myoji'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
      end
      it '名前（カナ）が空では登録できない' do
        @user.katakana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end
      it '苗字（カナ）が空では登録できない' do
        @user.katakana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
      end
      it '名前（カナ）が全角カタカナでないと登録できない' do
        @user.katakana_first_name = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana first name には全角カタカナを使用してください')
      end
      it '苗字（カナ）が全角カタカナでないと登録できない' do
        @user.katakana_last_name = 'みょうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana last name には全角カタカナを使用してください')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
