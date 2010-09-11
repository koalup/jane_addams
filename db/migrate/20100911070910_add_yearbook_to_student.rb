class AddYearbookToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :yearbook, :boolean, :default => false
  end

  def self.down
    remove_column :students, :yearbook
  end
end
