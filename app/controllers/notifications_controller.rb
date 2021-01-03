class NotificationsController < ApplicationController
  def index
  end

  def checked
    notification = Notification.find(params[:id])
    notification.checked ? notification.update(checked: false) : notification.update(checked: true)
    response = Notification.find(params[:id])
    render json: { notification: response}
  end
end