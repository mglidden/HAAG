class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.references :assignment
      t.datetime :completed_at

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :assignment_id
  end
end
