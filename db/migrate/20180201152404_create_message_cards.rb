class CreateMessageCards < ActiveRecord::Migration
  def change
    create_table :message_cards do |t|
      t.text :message
      t.integer :card_type_id

      t.timestamps null: false
    end
  end
end