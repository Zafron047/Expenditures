require 'rails_helper'

RSpec.describe 'User authentication', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to create a category' do
    visit new_group_path
    fill_in 'Name', with: 'Test Group'
    click_button 'Create Group'
    select 'Rent', from: 'Icon'
    within('form') do
      click_button 'Create Group'
    end
    sleep(1)
    expect(page).to have_content('Test Group')
  end

  it 'allows a user to see Most recent' do
    visit root_path
    sleep(1)
    expect(page).to have_content('Most recent')
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
