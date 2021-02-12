require 'rails_helper'

RSpec.describe Car, type: :model do
  before do
    @car = FactoryBot.build(:car)
  end

  describe '新規車両情報作成' do
    context '成功する時' do
      it '全ての値があれば保存できる' do
        expect(@car).to be_valid
      end
    end

    context '失敗する時' do
      it '車種が空欄では保存できない' do
        @car.name = ""
        @car.valid?
        expect(@car.errors.full_messages).to include "車種を入力してください"
      end
      it '車体番号が大文字の英数字だと保存できない' do
        @car.vehicle_number = "ｇｔ０００００１"
        @car.valid?
        expect(@car.errors.full_messages).to include "車体番号は半角英数字のみ使用できます"
      end

      it '運輸局は4文字以内でなければ保存できない' do
        @car.transport_bureau = "あああああ"
        @car.valid?
        expect(@car.errors.full_messages).to include "運輸局は4文字以内で入力してください"
      end

      it '運輸局はひらがな・漢字以外は保存できない' do
        @car.transport_bureau = "aaaa"
        @car.valid?
        expect(@car.errors.full_messages).to include "運輸局はひらがな・漢字のみ使用できます"
      end

      it '分類番号は3文字以内でなければ保存できない' do
        @car.class_number = "3000"
        @car.valid?
        expect(@car.errors.full_messages).to include "分類番号は3文字以内で入力してください"
      end

      it '分類番号は数字以外保存できない' do
        @car.class_number = "３００"
        @car.valid?
        expect(@car.errors.full_messages).to include "分類番号は半角数字のみ使用できます"
      end

      it '登録種別は1文字以外保存できない' do
        @car.registration_type = "むむ"
        @car.valid?
        expect(@car.errors.full_messages).to include "登録種別はひらがな1文字で入力してください"
      end

      it '登録種別はひらがな以外保存できない' do
        @car.registration_type = "a"
        @car.valid?
        expect(@car.errors.full_messages).to include "登録種別はひらがな1文字で入力してください"
      end

      it '登録番号は4文字以内でないと保存できない' do
        @car.registration_number = "18931"
        @car.valid?
        expect(@car.errors.full_messages).to include "登録番号は4文字以内で入力してください"
      end

      it '登録番号は数字以外保存できない' do
        @car.registration_number = "１８９３"
        @car.valid?
        expect(@car.errors.full_messages).to include "登録番号は半角数字のみ使用できます"
      end

      it '車検満了日は8文字以内でないと保存できない' do
        @car.vehicle_inspection_day = "202112233"
        @car.valid?
        expect(@car.errors.full_messages).to include "車検満了日は8文字以内で入力してください"
      end

      it '車検満了日は数字以外保存できない' do
        @car.vehicle_inspection_day = "２０２１１２２３"
        @car.valid?
        expect(@car.errors.full_messages).to include "車検満了日は半角数字のみ使用できます"
      end

      it '初度登録日は8文字以内でないと保存できない' do
        @car.registered_year = "202112233"
        @car.valid?
        expect(@car.errors.full_messages).to include "初度登録日は8文字以内で入力してください"
      end

      it '初度登録日は数字以外保存できない' do
        @car.registered_year = "２０２１１２２３"
        @car.valid?
        expect(@car.errors.full_messages).to include "初度登録日は半角数字のみ使用できます"
      end

      it '全ての値が空欄でも、保存できる' do
        @car.name = ""
        @car.vehicle_number = ""
        @car.transport_bureau = ""
        @car.class_number = ""
        @car.registration_type = ""
        @car.registration_number = ""
        @car.vehicle_inspection_day = ""
        @car.registered_year = ""

        @car.valid?
        expect(@car.errors.full_messages).to include "車体番号は半角英数字のみ使用できます"
      end
    end
  end
end
