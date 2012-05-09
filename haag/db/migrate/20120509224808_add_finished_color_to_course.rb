class AddFinishedColorToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :finished_color, :string
  end
end
