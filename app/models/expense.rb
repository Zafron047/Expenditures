class Expense < ApplicationRecord
  belongs_to :author_id, class_name: 'User', foreign_key: 'author_id'
  # has_and_belongs_to_many :groups
  has_many :groups, through: :group_expenses
  has_many :group_expenses
end
