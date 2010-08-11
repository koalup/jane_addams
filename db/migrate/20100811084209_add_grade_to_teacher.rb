class AddGradeToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :grade, :string
  end

  def self.down
    remove_column :teachers, :grade
  end
end
