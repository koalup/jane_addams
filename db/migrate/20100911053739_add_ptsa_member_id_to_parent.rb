class AddPtsaMemberIdToParent < ActiveRecord::Migration
  def self.up
    add_column :parents, :ptsa_member_id, :bigint
  end

  def self.down
    remove_column :parents, :ptsa_member_id
  end
end
