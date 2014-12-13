class AddSsidToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :ssid, :string
    add_index :regions, :ssid,  unique: true
  end
end
