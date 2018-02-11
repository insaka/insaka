class AddParamsStatusTransactionIdPurchasedAtToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :notification_params, :text
    add_column :donations, :status, :string
    add_column :donations, :transaction_id, :string
    add_column :donations, :purchased_at, :datetime
  end
end
