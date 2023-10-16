# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end
# # db/seeds.rb

# # Clear existing data
# Expense.destroy_all
# GroupExpense.destroy_all
# Group.destroy_all
# User.destroy_all

# # Create Users
# user1 = User.create!(name: "User 1")
# user2 = User.create!(name: "User 2")

# # Create Groups
# group1 = Group.create!(name: "Group 1", icon: "icon1", user: user1)
# group2 = Group.create!(name: "Group 2", icon: "icon2", user: user2)

# # Create Expenses
# expense1 = Expense.create!(author_id: user1, name: "Expense 1", amount: 100.0)
# expense2 = Expense.create!(author_id: user2, name: "Expense 2", amount: 150.0)

# # Create Group Expenses
# GroupExpense.create!(group: group1, expense: expense1)
# GroupExpense.create!(group: group1, expense: expense2)
# GroupExpense.create!(group: group2, expense: expense2)
