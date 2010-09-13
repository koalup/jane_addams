# == Schema Information
# Schema version: 20100913033850
#
# Table name: ptsa_board_members
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

class PtsaBoardMember < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :position, :position_type
  validates_presence_of :first_name, :last_name, :position, :position_type
  default_scope :order => 'last_name'

  def display_name
    if last_name.nil?
      display_name=""
    else
      "#{last_name}, #{first_name}"
    end
  end

  def position_types
    ["Board","Executive Board"]
  end
end
