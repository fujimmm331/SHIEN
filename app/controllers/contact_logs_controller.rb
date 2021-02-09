class ContactLogsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @logs = @customer.contact_logs.order(created_at: :desc).includes(:user)
  end

  def create
    @contact_log = ContactLog.new(contact_log_params)
    @contact_log.save if @contact_log.valid?
    @contact_log.notification_create(@contact_log.user.id, @contact_log.customer.user.id, @contact_log.customer.id, @contact_log.id) if current_user.id != @contact_log.customer.user.id
    redirect_to customer_path(params[:customer_id])
  end
end

private

def contact_log_params
  params.require(:contact_log).permit(:status, :comment).merge(user_id: current_user.id, team_id:current_user.team.id, customer_id: params[:customer_id])
end