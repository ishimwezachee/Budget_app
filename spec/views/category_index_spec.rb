require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  describe 'index page' do
    before(:each) do
      visit user_session_path
      @danny = User.create!(name: 'zachee', email: 'zachee@gmail.com', password: '123456', password_confirmation: '123456')

      within('#new_user') do
        fill_in 'Email', with: 'zachee@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'expect page after sign in to be categories path' do
      expect(page).to have_current_path authenticated_root_path
    end

    it 'categories page shows the right content' do
      expect(page).to have_content('Categories')
      expect(page).to have_content('Logout')
      expect(page).to have_link('New category')
    end

    it 'clicking on add category link should go to add category page' do
      click_link 'New category'
      expect(page).to have_current_path new_category_path
    end
  end
end