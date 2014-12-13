class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :region_id
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
