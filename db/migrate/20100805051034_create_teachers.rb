class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position
      t.string :position_type
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
