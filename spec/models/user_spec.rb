require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  
  describe 'ユーザー新規登録' do

    context '新規登録できる時' do
      it '全てのカラムが入っていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it '名前が空では保存できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "氏名を入力してください"
      end

      it 'emailが空では保存できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end

      it 'emailは一意性である' do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.email = @user.email
        other_user.valid?
        expect(other_user.errors.full_messages).to include "Eメールはすでに存在します"
      end

      it 'emailは＠がなければ保存できない' do
        @user.email = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end

      it 'passwordが空では保存できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'passwordは全角を使用できない' do
        @user.password = "あああああ１２"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは半角英数字を含み、6文字以上でお願いします"
      end

      it 'passwordは6文字以上でなければならない' do
        @user.password = "aa123"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end

      it 'passwordは半角英数字混合でなければならない' do
        @user.password = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは半角英数字を含み、6文字以上でお願いします"
      end

      it 'team_idが空では保存できない' do
        @user.team = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "所属を入力してください"
      end
    end
  end
end