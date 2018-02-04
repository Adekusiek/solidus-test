Spree::LineItem.class_eval do
  has_one :message_card, dependent: :destroy
  accepts_nested_attributes_for :message_card
  # accepts_nested_attributes_for :message_card

  def set_message_card
    message_card = self.message_card || self.build_message_card(message: "メッセージを入れてください")
    return message_card
  end
end
