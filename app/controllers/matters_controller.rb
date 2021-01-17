require 'csv'
require 'date'

class MattersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_matter, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]
  
  def index
    @matters = Matter.all.order(id: "DESC")

    #htmlを返すか、csvを返すかの処理
    respond_to do |f|
      f.html
      f.csv do
        csv_data = Matter.download_matters_csv(@matters)
        send_data(csv_data, filename: "#{Date.today}.csv")
      end
    end
    #/htmlを返すか、csvを返すかの処理
  end

  def new
    @matter = Matter.new
  end
  
  def create
    @matter = Matter.new(matter_params)
    if @matter.valid?
      @matter.save
      redirect_to matter_path(@matter.id)
    else
      render :new
    end
  end

  def show
    @contact_log = ContactLog.new
    @logs = @matter.contact_logs.order(created_at: :desc).limit(4)

    #htmlを返すか、csvを返すかの処理
    respond_to do |f|
      f.html
      f.csv do
        csv_data = Matter.download_matter_csv(@matter)
        send_data(csv_data, filename: "#{@matter.name}(#{Date.today}).csv")
      end
    end
    #/htmlを返すか、csvを返すかの処理
  end

  def edit  
  end

  def update
    if @matter.update(matter_params)
      redirect_to matter_path(@matter.id)
    else
      render :edit
    end
  end

  def destroy
    @matter.destroy
    redirect_to root_path
  end

  def search
    #@mattersに検索結果を代入
    @matters = Matter.search(search_params)
    #/@mattersに検索結果を代入

    #htmlを返すか、csvを返すかの処理
    respond_to do |f|
      f.html do
        redirect_to matter_path(@matters[0]["id"]) if @matters.count == 1
      end
      f.csv do
        csv_data = Matter.download_matters_csv(@matters)
        send_data(csv_data, filename: "#{Date.today}.csv")
      end
    end
    #/htmlを返すか、csvを返すかの処理
  end
  

  private
  def matter_params
    params.require(:matter).permit(:name, :sales_person, :kana_sales_person, :email, :phone_number, :cell_phone_number, :postal_code, :municipality, :address, :building).merge(user_id: current_user.id, team_id:current_user.team.id)
  end

  def search_params
    params.permit(:phone_num, :id, :name) 
  end

  def user_check
    if current_user.id != @matter.user.id
      redirect_to matter_path(@matter.id)
    end
  end

  def find_matter
    @matter = Matter.find(params[:id])
  end
end
