require 'csv'
require 'date'

class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_customer, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]
  
  def index
    @customers = Customer.includes(:user).order(id: "DESC")

    #htmlを返すか、csvを返すかの処理
    respond_to do |f|
      f.html
      f.csv do
        csv_data = Customer.download_customers_csv(@customers)
        send_data(csv_data, filename: "#{Date.today}.csv")
      end
    end
    #/htmlを返すか、csvを返すかの処理
  end

  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.valid?
      @customer.save
      redirect_to customer_path(@customer.id)
    else
      render :new
    end
  end

  def show
    @contact_log = ContactLog.new
    @logs = @customer.contact_logs.includes(:user).order(created_at: :desc).limit(4)

    #htmlを返すか、csvを返すかの処理
    respond_to do |f|
      f.html
      f.csv do
        csv_data = Customer.download_customer_csv(@customer)
        send_data(csv_data, filename: "#{@customer.name}(#{Date.today}).csv")
      end
    end
    #/htmlを返すか、csvを返すかの処理
  end

  def edit  
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to root_path
  end

  def search
    #@customersに検索結果を代入
    @customers = Customer.search(search_params).order(id: "DESC")
    #/@customersに検索結果を代入
    #htmlを返すか、csvを返すかの処理
    respond_to do |f|
      f.html do
        redirect_to customer_path(@customers[0]["id"]) if @customers.count == 1
      end
      f.csv do
        csv_data = Customer.download_customers_csv(@customers)
        send_data(csv_data, filename: "#{Date.today}.csv")
      end
    end
    #/htmlを返すか、csvを返すかの処理
  end
  
  def chosed_csv_export
    # 出力するレコードを取得
    @customers = if params[:colmun].present?
                Customer.select(params[:colmun]).where(id: params[:id]).order(id: "DESC") #カラム指定有の場合
               else
                Customer.where(id: params[:id]).order(id: "DESC") #無の場合
               end

    respond_to do |f|
      f.html
      f.csv do
        # カラム指定の有無により、メソッドをわける
        csv_data = if params[:colmun].present?
                     Customer.download_customers_csv_with_colmuns(@customers, params[:colmun])
                   else
                     Customer.download_customers_csv(@customers)
                   end
        # /カラム指定の有無により、メソッドを分ける

        send_data(csv_data, filename: "#{Date.today}.csv")
      end
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :kana_name, :email, :phone_number, :cell_phone_number, :postal_code, :municipality, :address, :building, :hobby, :memo).merge(user_id: current_user.id, team_id:current_user.team.id)
  end

  def search_params
    params.permit(:phone_num, :id, :name) 
  end



  def user_check
    redirect_to customer_path(@customer.id) if current_user.id != @customer.user.id
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
