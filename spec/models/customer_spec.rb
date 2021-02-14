require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
  end

  
  describe '案件新規作成' do

    context '新規作成できる時' do
      it '全てのカラムが入っていれば保存できる' do
        expect(@customer).to be_valid
      end

      it '建物名が空欄でも保存できる' do
        @customer.building = ""
        expect(@customer).to be_valid
      end

      it '趣味が空欄でも保存できる' do
        @customer.hobby = ""
        expect(@customer).to be_valid
      end

      it 'セールスメモが空欄でも保存できる' do
        @customer.memo = ""
        expect(@customer).to be_valid
      end

      it '建物名と、趣味が空欄でも保存できる' do
        @customer.building = ""
        @customer.hobby = ""
        expect(@customer).to be_valid
      end

      it '建物名と、セールスメモが空欄でも保存できる' do
        @customer.building = ""
        @customer.memo = ""
        expect(@customer).to be_valid
      end

      it 'セールスメモと、趣味が空欄でも保存できる' do
        @customer.memo = ""
        @customer.hobby = ""
        expect(@customer).to be_valid
      end

      it '建物名、趣味、セールスメモが空欄でも保存できる' do
        @customer.building = ""
        @customer.hobby = ""
        @customer.memo = ""
        expect(@customer).to be_valid
      end
    end

    context '新規作成できない時' do
      it '案件名が空では保存できない' do
        @customer.name = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include "お客様名を入力してください"
      end

      it 'お客様名（フリガナ）が空では保存できない' do
        @customer.kana_name = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include "お客様名（フリガナ）を入力してください"
      end

      it 'フリガナはカタカナ以外を保存できない' do
        @customer.kana_name = "あああああ"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "お客様名（フリガナ）は全角カタカナのみ使用できます"
      end

      it 'フリガナは半角カタカナを保存できない' do
        @customer.kana_name = "ｱｱｱｱ"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "お客様名（フリガナ）は全角カタカナのみ使用できます"
      end

      it 'メールアドレスが正しい表記でなければ保存できない' do
        @customer.email = "aaaaa"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "メールアドレスが間違っています"
      end

      it '電話番号が空では保存できない' do
        @customer.phone_number = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include "電話番号を入力してください"
      end

      it '電話番号は数字以外を保存できない' do
        @customer.phone_number = "あいうえお"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "電話番号は半角数字・11桁以内でお願いします"
      end

      it '電話番号は12桁以上を保存できない' do
        @customer.phone_number = "030000000000"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "電話番号は半角数字・11桁以内でお願いします"
      end

      it '電話番号は全角数字を保存できない' do
        @customer.phone_number = "０３１１１１２２２２"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "電話番号は半角数字・11桁以内でお願いします"
      end

      it '携帯電話番号が空では保存できない' do
        @customer.cell_phone_number = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include "携帯電話番号を入力してください"
      end

      it '携帯電話番号は12桁以上を保存できない' do
        @customer.cell_phone_number = "090000000000"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "携帯電話番号は半角数字・11桁以内でお願いします"
      end

      it '携帯電話番号は全角数字を保存できない' do
        @customer.cell_phone_number = "０９０１１１１２２２２"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "携帯電話番号は半角数字・11桁以内でお願いします"
      end

      it '郵便番号が空では保存できない' do
        @customer.postal_code = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include "郵便番号を入力してください"
      end

      it '郵便番号は数字以外を保存できない' do
        @customer.postal_code = "あああああああ"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "郵便番号は半角数字・7桁以内でお願いします"
      end

      it '郵便番号は全角数字を保存できない' do
        @customer.postal_code = "１２３４５６７"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "郵便番号は半角数字・7桁以内でお願いします"
      end

      it '郵便番号を8桁以上を保存できない' do
        @customer.postal_code = "12345678"
        @customer.valid?
        expect(@customer.errors.full_messages).to include "郵便番号は半角数字・7桁以内でお願いします"
      end

      it '市区町村が空では保存できない' do
        @customer.municipality = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include "住所を入力してください"
      end

      it '番地が空では保存できない' do
        @customer.address = ""
        @customer.valid?
        expect(@customer.errors.full_messages).to include "番地を入力してください"
      end

      it 'ユーザーが空では保存できない' do
        @customer.user = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include "ユーザーを入力してください"
      end

      it '番地が空では保存できない' do
        @customer.team = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include "所属を入力してください"
      end
    end
  end
end
