class AddPtsaMemberToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :ptsa_member, :boolean, :default => false
  end

  def self.down
    remove_column :teachers, :ptsa_member
  end
end
