class ParentsController < ApplicationController
  def index
    @parents = Parent.all
  end

  def show
    @parent = Parent.find(params[:id])
    @students = @parent.students
  end

  def new
    @parent = Parent.new
    @students = Student.find(:all)
  end

  def create
    @parent = Parent.new(params[:parent])
    @students = Student.find(:all)
    if @parent.save
      redirect_to(parents_url, :notice => "#{@parent.display_name} was successfully created.")
    else
      render 'new'
    end
  end
 
  def edit
    @parent = Parent.find(params[:id])
    @students = Student.find(:all)
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(params[:parent])
      redirect_to(@parent, :notice => "#{@parent.display_name} was successfully updated.")
    else
      render 'edit'
    end
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    redirect_to(parents_url, :notice => "#{@parent.display_name} was successfully removed.")
  end

  def add_student
    @parent = Parent.find(params[:id])
    @students.find(:all)
  end
end
