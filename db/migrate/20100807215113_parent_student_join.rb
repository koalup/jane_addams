class ParentStudentJoin < ActiveRecord::Migration
  def self.up
    create_table :parents_students, :id => false do |t|
      t.integer :parent_id
      t.integer :student_id
    end
  end

  def self.down
    drop_table :parents_students
  end
end
