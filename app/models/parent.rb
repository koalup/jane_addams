# == Schema Information
# Schema version: 20100806220552
#
# Table name: parents
#
#  id              :integer(4)      not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  home_phone      :string(255)
#  cell_phone      :string(255)
#  address_line_1  :string(255)
#  address_line_2  :string(255)
#  city            :string(255)
#  state           :string(255)
#  zip             :string(255)
#  show_cell_phone :boolean(1)
#  mailing_list    :boolean(1)
#  ptsa_member     :boolean(1)
#  publish         :boolean(1)
#  created_at      :datetime
#  updated_at      :datetime
#

class Parent < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :home_phone, :cell_phone, :address_line_1, :address_line_2, :city, :state, :zip, :show_cell_phone, :mailing_list, :ptsa_member, :publish
  validates_presence_of :first_name, :last_name
  has_and_belongs_to_many :students
  default_scope :order => 'last_name'
end
