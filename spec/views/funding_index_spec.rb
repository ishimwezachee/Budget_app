require 'rails_helper'

RSpec.describe 'group', type: :feature do
  describe 'new page' do
    before(:each) do
      visit user_session_path
      @danny = User.create!(name: 'zac',email: 'zac@gmail.com',password: '123456', password_confirmation: '123456')

      @group = Group.create!(name: 'category1', icon: 'test.png', user_id: @danny.id)
      within('#new_user') do
        fill_in 'Email', with: 'zac@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('category1')
      click_link 'category1'
      expect(page).to have_current_path group_payments_path(@group.id)
    end

    # it 'transactions page have the right content' do
    #   expect(page).to have_content('Transactions')
    #   expect(page).to have_content('Total spent:')
    #   expect(page).to have_content('Back')
    #   expect(page).to have_content('Add transaction')
    # end

    # it 'clicking on Add transaction will go to add transaction page' do
    #   click_link 'Add transaction'
    #   expect(page).to have_current_path new_group_payment_path(@group.id)
    # end
  end
end