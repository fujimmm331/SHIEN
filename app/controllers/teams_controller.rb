class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index   
    @notifications = @notifications.limit(3) if user_signed_in?
  end
  
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.valid?
      @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
