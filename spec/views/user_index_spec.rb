require 'rails_helper'

RSpec.describe 'On user views', type: :system do
  describe 'index page' do
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

    it 'I can see the number of posts for user has written' do
      visit users_path
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end

    it 'When I click on a user, I am redirected to that user\'s show page' do
      visit users_path(@user)
      expect(current_path).to eq(users_path(@user))
    end
  end
end
