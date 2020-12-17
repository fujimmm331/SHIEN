require 'rails_helper'

RSpec.describe Matter, type: :model do
  before do
    @matter = FactoryBot.build(:matter)
  end

  
  describe '案件新規作成' do

    context '新規作成できる時' do
      it '全てのカラムが入っていれば登録できる' do
        expect(@matter).to be_valid
      end
    end

    context '新規作成できない時' do
      it '案件名が空では保存できない' do
        @matter.name = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Name can't be blank"
      end

      it '先方の担当者が空では保存できない' do
        @matter.sales_person = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Sales person can't be blank"
      end

      it 'フリガナが空では保存できない' do
        @matter.kana_sales_person = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Kana sales person can't be blank"
      end

      it 'フリガナはカタカナ以外を保存できない' do
        @matter.kana_sales_person = "あああああ"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Kana sales person is invalid. Input full-width katakana characters."
      end

      it 'フリガナは半角カタカナを保存できない' do
        @matter.kana_sales_person = "ｱｱｱｱ"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Kana sales person is invalid. Input full-width katakana characters."
      end

      it '電話番号が空では保存できない' do
        @matter.phone_number = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号は数字以外を保存できない' do
        @matter.phone_number = "あいうえお"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Phone number can use only half-width numbers."
      end

      it '電話番号は12桁以上を保存できない' do
        @matter.phone_number = "030000000000"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Phone number can use only half-width numbers."
      end

      it '電話番号は全角数字を保存できない' do
        @matter.phone_number = "０３１１１１２２２２"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Phone number can use only half-width numbers."
      end

      it '携帯電話番号が空では保存できない' do
        @matter.cell_phone_number = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Cell phone number can't be blank"
      end

      it '携帯電話番号は12桁以上を保存できない' do
        @matter.phone_number = "090000000000"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Phone number can use only half-width numbers."
      end

      it '携帯電話番号は全角数字を保存できない' do
        @matter.phone_number = "０９０１１１１２２２２"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Phone number can use only half-width numbers."
      end

      it '郵便番号が空では保存できない' do
        @matter.postal_code = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号は数字以外を保存できない' do
        @matter.postal_code = "あああ-ああああ"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Postal code should include hyphen, and can use only half-width numbers."
      end

      it '郵便番号は全角数字を保存できない' do
        @matter.postal_code = "１２３-４５６７"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Postal code should include hyphen, and can use only half-width numbers."
      end

      it 'ハイフン抜きでは郵便番号を保存できない' do
        @matter.postal_code = "1234567"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Postal code should include hyphen, and can use only half-width numbers."
      end

      it '市区町村が空では保存できない' do
        @matter.municipality = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Municipality can't be blank"
      end

      it '番地が空では保存できない' do
        @matter.address = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Address can't be blank"
      end

      it 'ユーザーが空では保存できない' do
        @matter.user = nil
        @matter.valid?
        expect(@matter.errors.full_messages).to include "User must exist"
      end

      it '番地が空では保存できない' do
        @matter.team = nil
        @matter.valid?
        expect(@matter.errors.full_messages).to include "Team must exist"
      end
    end
  end
end
