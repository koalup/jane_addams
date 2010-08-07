# == Schema Information
# Schema version: 20100805051500
#
# Table name: teachers
#
#  id            :integer(4)      not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  email         :string(255)
#  position      :string(255)
#  position_type :string(255)
#  location      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :position, :position_type, :location

  validates_presence_of :first_name, :last_name, :position, :position_type
  has_many :students

  def last_comma_first
    "#{last_name}, #{first_name}"
  end

  def location_dash_teacher
    "#{location} - #{last_name}, #{first_name}"
  end
end
