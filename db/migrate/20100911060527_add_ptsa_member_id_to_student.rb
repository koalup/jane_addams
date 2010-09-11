class AddPtsaMemberIdToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :ptsa_member_id, :bigint
  end

  def self.down
    remove_column :students, :ptsa_member_id
  end
end
