class CreateAssignmentsLists < ActiveRecord::Migration
  def change
    create_table :assignments_lists do |t|

      t.timestamps
    end
  end
end
