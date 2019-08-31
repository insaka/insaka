class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :donations
    drop_table :users
  end
end
