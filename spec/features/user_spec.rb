require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  it 'allows a user to register' do
    visit new_user_registration_path
    fill_in 'Name', with: 'New User'
    fill_in 'Email', with: 'newuser@example.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    click_button 'Sign up'
    sleep(1)
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end
end

RSpec.feature 'Users', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  it 'allows user to login' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    sleep(1)
    expect(page).to have_text('Most recent')
  end

  it 'allows user to logout' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    click_link 'Sign out'
    sleep(1)
    expect(page).to have_text('Sign in or sign up to continue.')
  end
end
