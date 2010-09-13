class PtsaBoardMembersController < ApplicationController
  def index
    @ptsa_board_members = PtsaBoardMember.all
  end

  def show
    @ptsa_board_member = PtsaBoardMember.find(params[:id])
  end

  def new
    @ptsa_board_member = PtsaBoardMember.new
  end

  def edit
    @ptsa_board_member = PtsaBoardMember.find(params[:id])
  end

  def create
    @ptsa_board_member = PtsaBoardMember.new(params[:ptsa_board_member])
    if @ptsa_board_member.save
      redirect_to(@ptsa_board_member, :notice => "#{@ptsa_board_member.display_name} was successfully created.")
    else
      render 'new'
    end
  end

  def update
    @ptsa_board_member = PtsaBoardMember.find(params[:id])
    if @ptsa_board_member.update_attributes(params[:ptsa_board_member])
      redirect_to(@ptsa_board_member, :notice => "#{@ptsa_board_member.display_name} was successfully updated.")
    else
      render 'edit'
    end
  end

  def destroy
    @ptsa_board_member = PtsaBoardMember.find(params[:id])
    @ptsa_board_member.destroy
    redirect_to(ptsa_board_members_url, :notice => "#{@ptsa_board_member.display_name} was successfully removed.")
  end
end
