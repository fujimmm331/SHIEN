class MattersController < ApplicationController
  def index
    @matters = Matter.all
  end
end
