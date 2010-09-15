# == Schema Information
# Schema version: 20100911071814
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
#  ptsa_member     :boolean(1)
#  ptsa_member_id  :integer(8)
#  yearbook        :boolean(1)
#  yearbook_qty    :integer(4)
#

class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :graduation_year, :teacher_id, :parent_list, :ptsa_member, :ptsa_member_id, :ptsa_member, :ptsa_member_id, :yearbook, :yearbook_qty
  validates_presence_of :first_name, :last_name

  has_and_belongs_to_many :parents
  belongs_to :teacher
  default_scope :order => 'last_name'

  attr_accessor :parent_list
  after_save :update_parents

  def display_name
    if ! last_name.nil?
      display_name = "#{last_name}, #{first_name}"
    end
  end

  def grade
    if ! graduation_year.nil?
      current_month = Date.current.month
      current_year  = Date.current.year
      if current_month >= 7
        grade = 8 - (graduation_year - current_year) + 1
      else
        grade = 8 - (graduation_year - current_year)
      end
    end
  end

  def update_parents
    parents.delete_all
    selected_parents = parent_list.nil? ? [] : parent_list.keys.collect{|id| Parent.find_by_id(id) }
    selected_parents.each {|parent| self.parents << parent}
  end
end
