class CreatePtsaBoardMembers < ActiveRecord::Migration
  def self.up
    create_table :ptsa_board_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position
      t.string :position_type

      t.timestamps
    end
  end

  def self.down
    drop_table :ptsa_board_members
  end
end
