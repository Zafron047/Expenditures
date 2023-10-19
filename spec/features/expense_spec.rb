require 'rails_helper'

RSpec.feature 'Expenses', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to create an expense' do
    visit new_group_expense_path(@group)
    fill_in 'Name', with: 'Test Expense'
    fill_in 'Amount', with: '100'
    select 'Sample Group', from: 'Group'
    within('form') do
      click_button 'Create expense'
    end
    sleep(1)
    expect(page).to have_content('Test Expense')
  end
end

RSpec.feature 'Expenses', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to see TOTAL AMOUNT' do
    visit new_group_expense_path(@group)
    fill_in 'Name', with: 'Test Expense'
    fill_in 'Amount', with: '100'
    select 'Sample Group', from: 'Group'
    within('form') do
      click_button 'Create expense'
    end
    sleep(1)
    expect(page).to have_content('Great, expense created successfully')
    expect(page).to have_content('Expenditures List')
    expect(page).to have_content('TOTAL AMOUNT:')
  end

  it 'allows a user to see Most recent' do
    visit root_path
    sleep(1)
    expect(page).to have_content('Most recent')
  end
end

RSpec.feature 'Contents', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to see Most ancient' do
    visit root_path
    sleep(1)
    expect(page).to have_content('Most ancient')
  end

  it 'allows a user to see Gift credit' do
    visit root_path
    sleep(1)
    expect(page).to have_content('Gift credit')
  end
end
