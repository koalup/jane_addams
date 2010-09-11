class AddPtsaMemberToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :ptsa_member, :boolean, :default => false
  end

  def self.down
    remove_column :students, :ptsa_member
  end
end
