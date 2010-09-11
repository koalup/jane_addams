class AddYearbookQtyToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :yearbook_qty, :int
  end

  def self.down
    remove_column :students, :yearbook_qty
  end
end
