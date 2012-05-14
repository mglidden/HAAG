class AddSharedToAssignments < ActiveRecord::Migration
  def up
    add_column :assignments, :shared, :boolean, :default => true
  end
  
  def down
    remove_column :assignments, :shared
  end    
end
