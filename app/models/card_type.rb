class CardType < ActiveRecord::Base
  has_many :message_cards
end
