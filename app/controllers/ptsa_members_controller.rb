class PtsaMembersController < ApplicationController
  def index
    @ptsa_members = PtsaMember.all
  end

  def show
    @ptsa_member = PtsaMember.find(params[:id])
  end

  def new
    @ptsa_member = PtsaMember.new
  end

  def edit
    @ptsa_member = PtsaMember.find(params[:id])
  end

  def create
    @ptsa_member = PtsaMember.new(params[:ptsa_member])
    if @ptsa_member.save
      redirect_to(ptsa_members_url, :notice => "#{@ptsa_member.display_name} was successfully created.")
    else
      render 'new'
    end
  end

  def update
    @ptsa_member = PtsaMember.find(params[:id])
    if @ptsa_member.update_attributes(params[:ptsa_member])
      redirect_to(ptsa_members_url, :notice => "#{@ptsa_member.display_name} was successfully updated.")
    else
      render 'edit'
    end
  end

  def destroy
    @ptsa_member = PtsaMember.find(params[:id])
    @ptsa_member.destroy
    redirect_to(ptsa_members_url, :notice => "#{@ptsa_member.display_name} was successfully removed.")
  end
end
