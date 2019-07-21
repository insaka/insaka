class DropScholars < ActiveRecord::Migration[5.1]
  def change
    drop_table :scholars
  end
end
