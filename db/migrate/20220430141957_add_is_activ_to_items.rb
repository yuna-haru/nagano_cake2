class AddIsActivToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :Is_Active, :boolean, :null => false, :default => true
  end
end
