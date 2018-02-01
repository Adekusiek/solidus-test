Spree::LineItem.class_eval do
  has_one :message_card, dependent: :destroy

end
