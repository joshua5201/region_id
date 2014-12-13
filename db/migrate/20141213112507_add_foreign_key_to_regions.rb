class AddForeignKeyToRegions < ActiveRecord::Migration
  def change
    add_index :regions, [:user_id]
    add_index :entries, [:region_id]
  end
end
