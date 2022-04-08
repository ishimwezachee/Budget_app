require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  describe 'new page' do
    before(:each) do
      visit user_session_path
      @zachee = User.create!(name: 'Zachee', email: 'zachee@gmail.com',password: '123456', password_confirmation: '123456')
      within('#new_user') do
        fill_in 'Email', with: 'zachee@gmail.com'
        fill_in 'Password', with: '123456'
      end

      click_button 'Log in'
      click_link 'New category'
    end

    it 'expect to have add category page' do
      expect(page).to have_current_path new_category_path
    end
    
    it 'Add category page shows the right New Category' do
      expect(page).to have_content('New category')
    end
    it 'Add category page shows the right content Create category' do
      expect(page).to have_button('Create Category')
    end

    it 'Add category page has the right fields' do
      expect(page).to have_field('category[name]')
      expect(page).to have_field('category[icon]')
    end
  end
end