class CreateAssignmentsListAssignmentsJoin < ActiveRecord::Migration
  def up
    create_table 'assignments_lists_assignments', :id => false do |t|
      t.column 'assignments_list_id', :integer
      t.column 'assignment_id', :integer
    end
  end

  def down
    drop_table 'assignments_lists_assignments'
  end
end
