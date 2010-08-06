class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :graduation_year
      t.integer :teacher_id

      t.timestamps
    end
    add_index :students, :teacher_id
  end

  def self.down
    drop_table :students
  end
end
