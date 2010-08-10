class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @parents = @student.parents
  end

  def new
    @student = Student.new
    @teacher = Teacher.find(:all, :conditions => "position_type = 'Teacher'")
    @parents = Parent.find(:all)
  end

  def create
    @teacher = Teacher.find(:all, :conditions => "position_type = 'Teacher'")
    @student = Student.new(params[:student])
    if @student.save
      redirect_to(@student, :notice => "#{@student.display_name} was successfully created.")
    else
      render 'new'
    end
  end 

  def edit
    @teacher = Teacher.find(:all, :conditions => "position_type = 'Teacher'")
    @student = Student.find(params[:id])
    @parents = Parent.find(:all)
  end

  def update
    @teacher = Teacher.find(:all, :conditions => "position_type = 'Teacher'")
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to(@student, :notice => "#{@student.display_name} was successfully updated.")
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to(students_url, :notice => "#{@student.display_name} was successfully removed.")
  end
end
