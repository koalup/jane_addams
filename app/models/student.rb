# == Schema Information
# Schema version: 20100805225544
#
# Table name: students
#
#  id              :integer(4)      not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  graduation_year :integer(4)
#  teacher_id      :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :graduation_year, :teacher_id
  validates_presence_of :first_name, :last_name, :graduation_year, :teacher_id

  has_and_belongs_to_many :parents
  belongs_to :teacher
  default_scope :order => 'last_name'

  def grade
    current_month = Date.current.month
    current_year  = Date.current.year
    if current_month >= 7
      grade = 8 - (graduation_year - current_year) + 1
    else
      grade = 8 - (graduation_year - current_year)
    end
  end
end
