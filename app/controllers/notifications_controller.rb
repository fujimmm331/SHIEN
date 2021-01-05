class NotificationsController < ApplicationController
  def index
  end

  def checked
    notification = Notification.find(params[:id])
    notification.update(checked: true) if notification.checked == false
    response = Notification.find(params[:id])
    render json: { notification: response}
  end
end