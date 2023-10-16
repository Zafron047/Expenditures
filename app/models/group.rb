class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_expenses
  has_many :expenses, through: :group_expenses
end
