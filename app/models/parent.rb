# == Schema Information
# Schema version: 20100809112804
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
#  publish         :boolean(1)      default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#

class Parent < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :home_phone, :cell_phone, :address_line_1, :address_line_2, :city, :state, :zip, :show_cell_phone, :mailing_list, :ptsa_member, :publish, :student_list
  validates_presence_of :first_name, :last_name
  has_and_belongs_to_many :students
  default_scope :order => 'last_name'

  attr_accessor :student_list
  after_save :update_students

  def display_name
    "#{last_name}, #{first_name}"
  end

  def update_students
    students.delete_all
    selected_students = student_list.nil? ? [] : student_list.keys.collect{|id| Student.find_by_id(id) }
    selected_students.each {|student| self.students << student}
  end
end
