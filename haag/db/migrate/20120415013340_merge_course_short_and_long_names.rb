class MergeCourseShortAndLongNames < ActiveRecord::Migration
  def up
    add_column :courses, :name, :string
    
    Course.all.each do |course|
      course.update_attribute(:name, "#{course.short_name} #{course.long_name}")      
    end
    
    remove_column :courses, :short_name
    remove_column :courses, :long_name
  end

  def down
    add_column :courses, :short_name, :string
    add_column :courses, :long_name, :string

    Course.all.each do |course|
      merged_name = course.read_attribute(:name)
      short_name, long_name = merged_name.split(' ', 2) 
      course.update_attribute(:short_name, short_name)      
      course.update_attribute(:long_name, long_name)
    end

    remove_column :courses, :name
  end
end
