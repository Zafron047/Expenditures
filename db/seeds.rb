# Create Users
user1 = User.create!(name: "User 1")
user2 = User.create!(name: "User 2")

# Create Groups
group1 = Group.create!(name: "Group 1", icon: "icon1", user_id: user1.id)
group2 = Group.create!(name: "Group 2", icon: "icon2", user_id: user2.id)

# Create Expenses
expense1 = Expense.create!(name: "Expense 1", amount: 100.0, author_id: user1.id)
expense2 = Expense.create!(name: "Expense 2", amount: 150.0, author_id: user2.id)

# Create Group Expenses (uncomment if needed)
# GroupExpense.create!(group_id: group1.id, expense_id: expense1.id)
# GroupExpense.create!(group_id: group1.id, expense_id: expense2.id)
# GroupExpense.create!(group_id: group2.id, expense_id: expense2.id)
