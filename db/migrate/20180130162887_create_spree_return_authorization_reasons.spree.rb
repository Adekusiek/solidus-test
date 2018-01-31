# This migration comes from spree (originally 20140713140455)
class CreateSpreeReturnAuthorizationReasons < ActiveRecord::Migration
  def change
    create_table :spree_return_authorization_reasons do |t|
      t.string :name
      t.boolean :active, default: true
      t.boolean :mutable, default: true

      t.timestamps null: true
    end

    reversible do |direction|
      direction.up do
        if defined?(Spree::ReturnAuthorizationReason)
          Spree::ReturnAuthorizationReason.create!(name: 'Better price available')
          Spree::ReturnAuthorizationReason.create!(name: 'Missed estimated delivery date')
          Spree::ReturnAuthorizationReason.create!(name: 'Missing parts or accessories')
          Spree::ReturnAuthorizationReason.create!(name: 'Damaged/Defective')
          Spree::ReturnAuthorizationReason.create!(name: 'Different from what was ordered')
          Spree::ReturnAuthorizationReason.create!(name: 'Different from description')
          Spree::ReturnAuthorizationReason.create!(name: 'No longer needed/wanted')
          Spree::ReturnAuthorizationReason.create!(name: 'Accidental order')
          Spree::ReturnAuthorizationReason.create!(name: 'Unauthorized purchase')
        end
      end
    end

    add_column :spree_return_authorizations, :return_authorization_reason_id, :integer
    add_index :spree_return_authorizations, :return_authorization_reason_id, name: 'index_return_authorizations_on_return_authorization_reason_id'
  end
end