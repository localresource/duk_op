class RenameCategoryFields < ActiveRecord::Migration
  def change
    rename_column :categories, :key, :danish
    rename_column :categories, :description, :english
    add_index :categories, :danish, unique: true
    add_index :categories, :english, unique: true
  end
end
