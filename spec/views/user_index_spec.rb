require 'rails_helper'

RSpec.describe 'User views', type: :system do
  describe 'users index page' do
    before(:example) do
      @user = User.create!(name: 'Sergiy',
                           photo: 'https://picsum.photos/id/0/5000/3333',
                           bio: 'Student of Microverse',
                           post_counter: 0)
    end

    it 'I can see the right header' do
      visit users_path
      expect(page).to have_content('Here is a list of users')
    end

    it 'I can see the right username' do
      visit users_path
      expect(page).to have_content('Sergiy')
    end

    it 'I can see the profile picture of users' do
      visit users_path
      expect(page).to have_css('img')
    end
  end
end
