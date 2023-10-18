class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    puts params.inspect
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @updated_group_expenses = @group.expenses.where(author_id: current_user).order(created_at: :desc)
      @total_amount = @updated_group_expenses.sum(:amount)
      @expenses = @updated_group_expenses.to_a
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @expenses = @user.expenses.order(:created_at)
    end
  end

  def new
    @expense = Expense.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.all
  end

  def create
    group_params = params[:expense][:group]
    name = params[:expense][:name]
    amount = params[:expense][:amount]

    @group = Group.find_by(name: group_params)
    @expense = current_user.expenses.build(name:, amount:)
    @group.expenses << @expense

    if @expense.save
      redirect_to group_expenses_path(@group), notice: 'Great, expense created successfully'
    else
      render :new, notice: 'Error: Expense not created'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount).merge(group: params[:expense][:group])
  end
end
