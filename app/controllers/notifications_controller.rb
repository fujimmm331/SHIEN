class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(visited_id: current_user.id).where.not(visiter_id: current_user.id).order(created_at: :desc)
  end
end