class MessageCard < ActiveRecord::Base
  belongs_to :card_type
  belongs_to :line_item
end
