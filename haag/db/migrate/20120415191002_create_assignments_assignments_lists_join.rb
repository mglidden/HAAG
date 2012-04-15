class CreateAssignmentsAssignmentsListsJoin < ActiveRecord::Migration
  def up
    create_table 'assignments_assignments_lists', :id => false do |t|
      t.column 'assignment_id', :integer
      t.column 'assignments_list_id', :integer
    end
  end

  def down
    drop_table 'assignments_assignments_lists'
  end
end
