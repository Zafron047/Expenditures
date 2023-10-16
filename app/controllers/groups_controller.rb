class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @groups = current_user.groups.includes(:expenses)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: "Great, group created successfully"
    else
      render :new, notice: "Error: Group not created"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
