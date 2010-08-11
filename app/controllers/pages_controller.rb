class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def directory
    @title = "Directory"

    @teachers_administrative = Teacher.find(:all, :conditions => "position_type = 'Administrative'")
    @teachers_teacher = Teacher.find(:all, :conditions => "position_type = 'Teacher'")
    @teachers_specialist = Teacher.find(:all, :conditions => "position_type = 'Specialist'")

    @ptsa_members_executive_board = PtsaMember.find(:all, :conditions => "position_type = 'Executive Board'")
    @ptsa_members_board = PtsaMember.find(:all, :conditions => "position_type = 'Board'")

    @students = Student.all
    @parents = Parent.find(:all)
  end
end
