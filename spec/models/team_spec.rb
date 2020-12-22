require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = FactoryBot.build(:team)
  end


  describe 'チーム作成' do
    context 'チームが作成できるとき' do
      it 'チーム名があれば作成できる' do
        expect(@team).to be_valid
      end
    end

    context 'チームが作成できないとき' do
      it 'チーム名が空欄だと保存できない' do
        @team.name = ""
        @team.valid?
        expect(@team.errors.full_messages).to include "チーム名を入力してください"
      end

      it 'チーム名がかぶっていると保存できない' do
        @team.save
        other_team = FactoryBot.build(:team)
        other_team.valid?
        expect(other_team.errors.full_messages).to include "チーム名はすでに存在します"
      end
    end
  end
end
