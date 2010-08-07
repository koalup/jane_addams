class CreateParents < ActiveRecord::Migration
  def self.up
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :home_phone
      t.string :cell_phone
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :show_cell_phone, :default => false
      t.boolean :mailing_list, :default => false
      t.boolean :ptsa_member, :default => false
      t.boolean :publish, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :parents
  end
end
