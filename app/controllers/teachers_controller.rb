class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @title = "#{@teacher.first_name} #{@teacher.last_name}"
  end

  def edit
    @teacher = Teacher.find(params[:id])
    @title = "Edit Teacher #{@teacher.first_name} #{@teacher.last_name}"
  end

  def new
    @teacher = Teacher.new
    @title = "New Teacher"
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      redirect_to(teachers_url, :notice => "Teacher #{@teacher.first_name} #{@teacher.last_name} was successfully created.")
    else
      @title = "New Teacher"
      render 'new'
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher])
      redirect_to(teachers_url, :notice => "Teacher #{@teacher.first_name} #{@teacher.last_name} was successfully updated.") 
    else
      render 'edit'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to(teachers_url, :notice => "Teacher #{@teacher.first_name} #{@teacher.last_name} was successfully removed.")
  end
end
