Spree::CheckoutController.class_eval do

  after_action :slack_notification, only: :update

  private
  def slack_notification
    if @order.completed?
      byebug
      notifier = Slack::Notifier.new(ENV["SLACK_POST_URL"]) #事前準備で取得したWebhook URL
      notifier.ping('新しい注文が来ました')
    end
  end
end
