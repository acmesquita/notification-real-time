class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}", notification: render_notification(notification)
    ActionCable.server.broadcast "notifications:#{notification.sender_id}", success: 'Aviso enviado com sucesso!'  end

  def render_notification(notification)
    ApplicationController.renderer.render(
      partial: 'notices/new_notification.html.erb',
      locals: {notification: notification}
    )
  end
end
