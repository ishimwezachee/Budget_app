require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  background { visit new_user_session_path }

  it 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  it 'display Password field' do
    expect(page).to have_field('user[password]')
  end

  it 'Display Login' do
        expect(page).to have_content 'Log in'
      end

 it 'Submit form with correct credintials' do
    @user = User.create(name: 'ALINE', email: 'aline@gmail.com', password: 'password')
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_current_path('/')
  end
end

