# == Schema Information
# Schema version: 20100811084209
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
#  grade         :string(255)
#

class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :position, :position_type, :location, :grade, :ptsa_member, :ptsa_member_id

  validates_presence_of :first_name, :last_name, :position, :position_type
  has_many :students
  default_scope :order => 'last_name'

  def display_name
    if last_name.nil?
      display_name = ""
    else
      display_name = "#{last_name}, #{first_name}"
    end
  end

  def position_types
    %w(Administrative Specialist Teacher)
  end

  def location_dash_teacher
    "#{location} - #{last_name}, #{first_name}"
  end
end
