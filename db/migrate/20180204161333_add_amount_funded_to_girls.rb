class AddAmountFundedToGirls < ActiveRecord::Migration[5.1]
  def change
  	add_column :girls, :amount_funded, :float
  end
end
