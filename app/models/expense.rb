class Expense < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :group_expenses
  has_many :groups, through: :group_expenses

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author_id, presence: true
end
