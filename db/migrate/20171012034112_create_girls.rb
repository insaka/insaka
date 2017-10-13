class CreateGirls < ActiveRecord::Migration[5.1]
  def change
    create_table :girls do |t|
      t.string :name
      t.float :percent_funded
      t.datetime :began_funding
    end
  end
end
