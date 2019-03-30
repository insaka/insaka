class AddColumnsToGirl < ActiveRecord::Migration[5.1]
  def change
    add_column :girls, :status, :string
    add_column :girls, :image, :string
    add_column :girls, :quote, :string
    add_column :girls, :first_name, :string
    add_column :girls, :last_name, :string
    remove_column :girls, :name, :string
  end
end
