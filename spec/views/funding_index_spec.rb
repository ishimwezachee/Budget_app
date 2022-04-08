require 'rails_helper'

RSpec.describe 'group', type: :feature do
  describe 'new page' do
    before(:each) do
      visit user_session_path
      zac = User.create!(name: 'zac', email: 'zac@gmail.com', password: '123456', password_confirmation: '123456')
      category = Category.create!(name: 'Categories', icon: 'default.png', user_id: zac.id)
      Funding.create!(name: 'fund1', amount: 20, id: 1, user_id: zac.id, category_id: category.id)
      within('#new_user') do
        fill_in 'Email', with: 'zac@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('Categories')
      click_link 'zac'
      expect(page).to have_current_path category_fundings_path(category.id)
    end

    it 'Fund page have the right content New funding' do
      expect(page).to have_content('New funding')
    end

    it 'Funding page have the right arrow' do
      expect(page).to have_content('⇐')
    end

    it 'Funding page have the right Funding' do
      expect(page).to have_content('Fundings')
    end

    it 'Funding page have the right Funding' do
      expect(page).to have_content('fund1')
    end

    it 'Funding page have the right Funding' do
      expect(page).to have_content('20$')
    end
  end
end
