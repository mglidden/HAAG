class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :description
      t.references :course

      t.timestamps
    end
    add_index :assignments, :course_id
  end
end
