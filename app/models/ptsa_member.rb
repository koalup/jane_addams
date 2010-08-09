# == Schema Information
# Schema version: 20100809112804
#
# Table name: ptsa_members
#
#  id            :integer(4)      not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  email         :string(255)
#  position      :string(255)
#  position_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class PtsaMember < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :position, :position_type
  validates_presence_of :first_name, :last_name, :position, :position_type
  default_scope :order => 'last_name'
  
  def display_name
    "#{last_name}, #{first_name}"
  end

  def position_types
    ["Executive Board","Board"]
  end
end
