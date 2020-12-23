class ContactLogsController < ApplicationController
  def index
  end

  def create
    ContactLog.create(contact_log_params)
    binding.pry
    redirect_to matter_path(params[:matter_id])
  end
end

private

def contact_log_params
  params.require(:contact_log).permit(:status, :comment).merge(user_id: current_user.id, team_id:current_user.team.id, matter_id: params[:matter_id])
end