class AddMessageToSpreeLineItem < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :message_card_id, :integer
  end
end
