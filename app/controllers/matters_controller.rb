class MattersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_matter, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]
  
  def index
    @matters = Matter.all.order(id: "DESC")
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

  private
  def matter_params
    params.require(:matter).permit(:name, :sales_person, :kana_sales_person, :email, :phone_number, :cell_phone_number, :postal_code, :municipality, :address, :building).merge(user_id: current_user.id, team_id:current_user.team.id)
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
