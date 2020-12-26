class ContactLogsController < ApplicationController
  def index
    @matter = Matter.find(params[:matter_id])
    @logs = @matter.contact_logs.order(created_at: :desc).includes(:user)
  end

  def create
    ContactLog.create(contact_log_params)
    redirect_to matter_path(params[:matter_id])
  end
end

private

def contact_log_params
  params.require(:contact_log).permit(:status, :comment).merge(user_id: current_user.id, team_id:current_user.team.id, matter_id: params[:matter_id])
end