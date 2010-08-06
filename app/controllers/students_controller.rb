class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to(students_url, :notice => "Student #{@student.first_name} #{@student.last_name} was successfully created.")
    else
      render 'new'
    end
  end 

  def edit
  end

end
