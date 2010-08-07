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
  end

  def create
    @parent = Parent.new(params[:parent])
    if @parent.save
      redirect_to(parents_url, :notice => "#{@parent.first_name} #{@parent.last_name} was successfully created.")
    else
      render 'new'
    end
  end
 
  def edit
    @parent = Parent.find(params[:id])
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(params[:parent])
      redirect_to(parents_url, :notice => "#{@parent.first_name} #{@parent.last_name} was successfully updated.")
    else
      render 'edit'
    end
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    redirect_to(parents_url, :notice => "#{@parent.first_name} #{@parent.last_name} was successfully removed.")
  end

end
