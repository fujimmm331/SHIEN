require 'rails_helper'

RSpec.describe "Teams", type: :request do
  describe '#index' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ログイン前' do
      it '正常にレスポンスを返すこと' do
        get teams_path
        expect(response.status).to eq(200)
      end
    end

    context 'ログイン後' do
      it '正常にレスポンスを返すこと' do
        sign_in @user
        get teams_path
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#new' do
    context 'ログイン前' do

    end

    context 'ログイン後' do
      
    end
  end

  describe '#create' do
    context 'ログイン前' do

    end

    context 'ログイン後' do
      
    end
  end
end