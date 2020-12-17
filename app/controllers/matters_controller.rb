class MattersController < ApplicationController
  before_action :sign_in_check
  def index
    @matters = Matter.all
  end

  private
  def sign_in_check
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
