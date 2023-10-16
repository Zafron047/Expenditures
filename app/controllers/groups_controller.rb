class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.includes(:expenses)
  end
end
