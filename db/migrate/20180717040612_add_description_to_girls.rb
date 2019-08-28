class AddDescriptionToGirls < ActiveRecord::Migration[5.1]
  def change
    add_column :girls, :description, :text
  end
end
