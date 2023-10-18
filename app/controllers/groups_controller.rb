class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = if user_signed_in?
                current_user.groups.includes(:expenses).order(created_at: :desc)
              else
                []
              end
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Great, group created successfully'
    else
      render :new, notice: 'Error: Group not created'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, user_id: current_user.id)
  end
end
