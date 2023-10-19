require 'rails_helper'
require 'database_cleaner'

RSpec.describe Expense, type: :model do
  before(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'Jack Sulivan', email: 'sulivan@example.com', password: 'password123')
      group = Group.create(name: 'group 1', user:)
      expense = Expense.new(name: 'Sample Item', user:, amount: 100.0)
      GroupExpense.new(group:, expense:)

      expect(expense).to be_valid
    end

    it 'is not valid without a name' do
      user = User.create(name: 'Jack Sulivan', email: 'sulivan@example.com', password: 'password123')
      group = Group.create(name: 'group 1', user:)
      expense = Expense.new(name: nil, user:, amount: 100.0)
      GroupExpense.new(group:, expense:)

      expect(expense).to_not be_valid
    end

    it 'is not valid without an amount' do
      user = User.create(name: 'Jack Sulivan', email: 'sulivan@example.com', password: 'password123')
      group = Group.create(name: 'group 1', user:)
      expense = Expense.new(name: 'Sample Item', user:, amount: nil)
      GroupExpense.new(group:, expense:)

      expect(expense).to_not be_valid
    end

    it 'is not valid with a non-numeric amount' do
      user = User.create(name: 'Jack Sulivan', email: 'sulivan@example.com', password: 'password123')
      group = Group.create(name: 'group 1', user:)
      expense = Expense.new(name: 'Sample Item', user:, amount: 'invalid_amount')
      GroupExpense.new(group:, expense:)

      expect(expense).to_not be_valid
    end

    it 'is not valid with a negative amount' do
      user = User.create(name: 'Jack Sulivan', email: 'sulivan@example.com', password: 'password123')
      group = Group.create(name: 'group 1', user:)
      expense = Expense.new(name: 'Sample Item', user:, amount: -100.0)
      GroupExpense.new(group:, expense:)

      expect(expense).to_not be_valid
    end

    it 'is not valid without an author' do
      user = User.create(name: 'Jack Sulivan', email: 'sulivan@example.com', password: 'password123')
      Group.create(name: 'group 1', user:)
      expense = Expense.new(name: 'Sample Item', user: nil, amount: -100.0)

      expect(expense).to_not be_valid
    end
  end
end
