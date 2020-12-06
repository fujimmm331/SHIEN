class TeamsController < ApplicationController
  def index    
  end
  
  def new
    @team = Team.new
  end
end
