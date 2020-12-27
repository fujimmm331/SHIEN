require 'rails_helper'

RSpec.describe ContactLog, type: :model do
  before do
    @contact_log = FactoryBot.build(:contact_log)
  end

  describe 'コンタクトログ作成' do
    context 'コンタクトログが作成できるとき' do
      it 'コンタクトログがあれば作成できる' do
        expect(@contact_log).to be_valid
      end

      it 'ステータスが空でも作成できる' do
        @contact_log.status = ""
        expect(@contact_log).to be_valid
      end
    end

    context 'コンタクトログが作成できないとき' do
      it 'コンタクトログが空欄だと保存できない' do
        @contact_log.comment = ""
        @contact_log.valid?
        expect(@contact_log.errors.full_messages).to include "コンタクトログを入力してください"
      end

      it 'チームの外部キーが空だと保存できない' do
        @contact_log.team = nil
        @contact_log.valid?
        expect(@contact_log.errors.full_messages).to include "Teamを入力してください"
      end

      it 'ユーザーの外部キーが空だと保存できない' do
        @contact_log.user = nil
        @contact_log.valid?
        expect(@contact_log.errors.full_messages).to include "Userを入力してください"
      end

      it '案件の外部キーが空だと保存できない' do
        @contact_log.matter = nil
        @contact_log.valid?
        expect(@contact_log.errors.full_messages).to include "Matterを入力してください"
      end
    end
  end
end
