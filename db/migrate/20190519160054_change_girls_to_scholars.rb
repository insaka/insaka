class ChangeGirlsToScholars < ActiveRecord::Migration[5.1]
  def change
    rename_table :girls, :scholars
  end
end
