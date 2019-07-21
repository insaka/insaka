class CreateScholars < ActiveRecord::Migration[5.1]
  def change
    create_table :scholars do |t|
      t.float :percent_funded
      t.datetime :began_funding
      t.float :amount_funded
      t.text :description
      t.string :status
      t.string :image
      t.string :quote
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
