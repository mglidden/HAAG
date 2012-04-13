class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :user
      t.references :assignment

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :assignment_id
  end
end
