require 'rails_helper'

RSpec.describe Notification, type: :model do
  before do
    @notification = FactoryBot.build(:notification)
  end

  describe '通知作成' do
    context '作成できるとき' do
      it '全て値が入っていれば保存できる' do
        expect(@notification).to be_valid
      end
    end

    context '作成できないとき' do
      
    end
  end
end
