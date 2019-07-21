class AddGirlIdToDonations < ActiveRecord::Migration[5.1]
  def change
  	add_column :donations, :girl_id, :integer
  end
end
