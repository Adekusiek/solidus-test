require 'dotenv'
Dotenv.load

Spree::CheckoutController.class_eval do

  after_action :slack_notification, only: :update

  private
  def slack_notification
    if @order.completed?
#      byebug
      puts ENV['SLACK_POST_URL']
      notifier = Slack::Notifier.new ENV['SLACK_POST_URL'],
                                channel: "#general",
                                username: "noti-bot"
      byebug
      notifier.delay.ping('新しい注文が来ました')
    end
  end
end
