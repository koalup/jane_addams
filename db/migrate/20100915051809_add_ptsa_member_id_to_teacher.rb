class AddPtsaMemberIdToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :ptsa_member_id, :bigint
  end

  def self.down
    remove_column :teachers, :ptsa_member_id
  end
end
