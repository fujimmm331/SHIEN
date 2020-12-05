class TeamsController < ApplicationController
  def index    
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
    params.require(:team).permit(:name).merge(user_id: current_user.id)
  end

end
