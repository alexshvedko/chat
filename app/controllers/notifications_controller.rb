class NotificationsController < ApplicationController
  def index
  end

  def create
    notification = Notification.create notification_params
    if notification.save
      WebsocketRails[:channel_name].trigger(:new, notification)
      render json: { status: 200 }
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:body, :user)
  end

end
