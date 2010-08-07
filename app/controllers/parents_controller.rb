class ParentsController < ApplicationController
  def index
    @parents = Parent.all
  end

  def show
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new
    if @parent.save
      redirect_to(parent_url, :notice => "#{@parent.first_name} #{@parent.last_name} was successfully created.")
    else
      render 'new'
    end
  end
 
  def edit
  end

end
