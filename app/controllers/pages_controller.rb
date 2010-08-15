class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def directory
    @title = "Directory"

    @teachers_administrative = Teacher.find(:all, :conditions => "position_type = 'Administrative'")
    @teachers_teacher = Teacher.find(:all, :conditions => "position_type = 'Teacher'", :order => "grade, last_name")
    @teachers_specialist = Teacher.find(:all, :conditions => "position_type = 'Specialist'", :order => "grade, last_name")

    @ptsa_members_executive_board = PtsaMember.find(:all, :conditions => "position_type = 'Executive Board'")
    @ptsa_members_board = PtsaMember.find(:all, :conditions => "position_type = 'Board'")

    @students = Student.all
    @parents = Parent.find(:all)

    render :action => "directory.html.erb", :layout => false
  end
end
