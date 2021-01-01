class ContactLogsController < ApplicationController
  def index
    @matter = Matter.find(params[:matter_id])
    @logs = @matter.contact_logs.order(created_at: :desc).includes(:user)
  end

  def create
    @contact_log = ContactLog.new(contact_log_params)
    @contact_log.save if @contact_log.valid?
    @contact_log.notification_create(@contact_log.user.id, @contact_log.matter.user.id, @contact_log.matter.id, @contact_log.id)
    redirect_to matter_path(params[:matter_id])
  end
end

private

def contact_log_params
  params.require(:contact_log).permit(:status, :comment).merge(user_id: current_user.id, team_id:current_user.team.id, matter_id: params[:matter_id])
end