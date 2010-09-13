class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def directory
    @title = "Directory"

    @teachers_administrative = Teacher.find(:all, :conditions => "position_type = 'Administrative'")
    @teachers_teacher = Teacher.find(:all, :conditions => "position_type = 'Teacher'", :order => "grade, last_name")
    @teachers_specialist = Teacher.find(:all, :conditions => "position_type = 'Specialist'", :order => "grade, last_name")

    @ptsa_board_members_executive_board = PtsaBoardMember.find(:all, :conditions => "position_type = 'Executive Board'")
    @ptsa_board_members_board = PtsaBoardMember.find(:all, :conditions => "position_type = 'Board'")

    @students = Student.all
    @parents = Parent.find(:all)

    render :action => "directory.html.erb", :layout => false
  end

  def ptsa_members
    @title = "PTSA Members"

    @parents = Parent.find(:all, :conditions => "ptsa_member = true")
    @students = Student.find(:all, :conditions => "ptsa_member = true")

  end
end
