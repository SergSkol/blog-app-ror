require 'rails_helper'

RSpec.describe 'On user view', type: :system do
  describe 'show page' do
    before(:example) do
      @user = User.create!(name: 'Sergiy',
                           photo: 'https://picsum.photos/id/0/5000/3333',
                           bio: 'Student of Microverse',
                           post_counter: 0)

      @post = Post.create!(title: 'Test post title',
                           text: 'Test post text',
                           author_id: @user.id,
                           comments_counter: 0,
                           likes_counter: 0)
    end

    it 'I can see the profile picture of users' do
      visit user_path(@user)
      expect(page).to have_selector("img[src='https://picsum.photos/id/0/5000/3333']")
    end

    it 'I can see the right username' do
      visit user_path(@user)
      expect(page).to have_content('Sergiy')
    end

    it 'I can see the number of posts for user has written' do
      visit user_path(@user)
      expect(page).to have_content('Number of posts: 1')
    end

    it 'I can see the users bio' do
      visit user_path(@user)
      expect(page).to have_content('Student of Microverse')
    end

    it 'I can see a button that lets me view all of a users posts' do
      visit user_path(@user)
      expect(page).to have_button('See all posts')
    end

    it 'When I click a users post, it redirects me to that posts show page' do
      visit user_path(@user)
      click_link('Test post title')
      expect(page).to have_current_path(user_post_path(@user, @post))
    end

    it 'When I click on a post, it redirects me to that post`s show page' do
      visit user_path(@user)
      click_button('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
