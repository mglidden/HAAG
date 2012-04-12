class AddDueAtToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :due_at, :datetime 
  end  
end
