require 'rails_helper'

RSpec.describe Matter, type: :model do
  before do
    @matter = FactoryBot.build(:matter)
  end

  
  describe '案件新規作成' do

    context '新規作成できる時' do
      it '全てのカラムが入っていれば保存できる' do
        expect(@matter).to be_valid
      end

      it '建物名が空欄でも保存できる' do
        @matter.building = ""
        expect(@matter).to be_valid
      end
    end

    context '新規作成できない時' do
      it '案件名が空では保存できない' do
        @matter.name = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "案件名を入力してください"
      end

      it '先方の担当者が空では保存できない' do
        @matter.sales_person = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "先方の担当者を入力してください"
      end

      it 'メールアドレスが空では保存できない' do
        @matter.email = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "メールアドレスを入力してください"
      end

      it 'メールアドレスが正しい表記でなければ保存できない' do
        @matter.email = "aaaaa"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "メールアドレスが間違っています"
      end

      it 'フリガナが空では保存できない' do
        @matter.kana_sales_person = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "フリガナを入力してください"
      end

      it 'フリガナはカタカナ以外を保存できない' do
        @matter.kana_sales_person = "あああああ"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "フリガナは全角カタカナのみ使用できます"
      end

      it 'フリガナは半角カタカナを保存できない' do
        @matter.kana_sales_person = "ｱｱｱｱ"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "フリガナは全角カタカナのみ使用できます"
      end

      it '電話番号が空では保存できない' do
        @matter.phone_number = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "電話番号を入力してください"
      end

      it '電話番号は数字以外を保存できない' do
        @matter.phone_number = "あいうえお"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "電話番号は半角数字・11桁以内でお願いします"
      end

      it '電話番号は12桁以上を保存できない' do
        @matter.phone_number = "030000000000"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "電話番号は半角数字・11桁以内でお願いします"
      end

      it '電話番号は全角数字を保存できない' do
        @matter.phone_number = "０３１１１１２２２２"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "電話番号は半角数字・11桁以内でお願いします"
      end

      it '携帯電話番号が空では保存できない' do
        @matter.cell_phone_number = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "携帯電話番号を入力してください"
      end

      it '携帯電話番号は12桁以上を保存できない' do
        @matter.cell_phone_number = "090000000000"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "携帯電話番号は半角数字・11桁以内でお願いします"
      end

      it '携帯電話番号は全角数字を保存できない' do
        @matter.cell_phone_number = "０９０１１１１２２２２"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "携帯電話番号は半角数字・11桁以内でお願いします"
      end

      it '郵便番号が空では保存できない' do
        @matter.postal_code = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "郵便番号を入力してください"
      end

      it '郵便番号は数字以外を保存できない' do
        @matter.postal_code = "あああああああ"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "郵便番号は半角数字・7桁以内でお願いします"
      end

      it '郵便番号は全角数字を保存できない' do
        @matter.postal_code = "１２３４５６７"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "郵便番号は半角数字・7桁以内でお願いします"
      end

      it '郵便番号を8桁以上を保存できない' do
        @matter.postal_code = "12345678"
        @matter.valid?
        expect(@matter.errors.full_messages).to include "郵便番号は半角数字・7桁以内でお願いします"
      end

      it '市区町村が空では保存できない' do
        @matter.municipality = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "市区町村を入力してください"
      end

      it '番地が空では保存できない' do
        @matter.address = ""
        @matter.valid?
        expect(@matter.errors.full_messages).to include "番地を入力してください"
      end

      it 'ユーザーが空では保存できない' do
        @matter.user = nil
        @matter.valid?
        expect(@matter.errors.full_messages).to include "ユーザーを入力してください"
      end

      it '番地が空では保存できない' do
        @matter.team = nil
        @matter.valid?
        expect(@matter.errors.full_messages).to include "所属を入力してください"
      end
    end
  end
end
