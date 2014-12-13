class AddImageToEntries < ActiveRecord::Migration
  def change
    change_column :entries, :content, :text
    add_column    :entries, :picture, :string
  end
end
