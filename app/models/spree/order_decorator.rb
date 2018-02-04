Spree::Order.class_eval do
  has_many :message_cards, through: :line_items
end
