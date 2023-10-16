class Group < ApplicationRecord
  belongs_to :user
  # has_and_belongs_to_many :expenses
  has_many :expenses, through: :group_expenses
  has_many :group_expenses
end
