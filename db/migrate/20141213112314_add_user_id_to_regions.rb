class AddUserIdToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :user_id, :integer
  end
end
