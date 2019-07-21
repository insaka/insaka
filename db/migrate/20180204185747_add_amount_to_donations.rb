class AddAmountToDonations < ActiveRecord::Migration[5.1]
  def change
  	add_column :donations, :amount, :float
  end
end
