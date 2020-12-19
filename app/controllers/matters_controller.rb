class MattersController < ApplicationController
  before_action :sign_in_check
  
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
    @matter = Matter.find(params[:id])
  end

  private
  def matter_params
    params.require(:matter).permit(:name, :sales_person, :kana_sales_person, :phone_number, :cell_phone_number, :postal_code, :municipality, :address, :building).merge(user_id: current_user.id, team_id:current_user.team.id)
  end

  def sign_in_check
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
