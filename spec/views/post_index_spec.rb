require 'rails_helper'

RSpec.describe 'On post view', type: :system do
  describe 'index page' do
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

      @comment = Comment.create!(text: 'Test comment text',
                                 author_id: @user.id,
                                 post_id: @post.id)
    end

    it 'I can see the profile picture of users' do
      visit user_posts_path(@user)
      expect(page).to have_selector("img[src='https://picsum.photos/id/0/5000/3333']")
    end

    it 'I can see the right username' do
      visit user_posts_path(@user)
      expect(page).to have_content('Sergiy')
    end

    it 'I can see the number of posts for user has written' do
      visit user_posts_path(@user)
      expect(page).to have_content('Number of posts: 1')
    end

    it 'I can see a post title' do
      visit user_posts_path(@user)
      expect(page).to have_content('Test post title')
    end

    it 'I can see some of the post body' do
      visit user_posts_path(@user)
      expect(page).to have_content('Test post text')
    end

    it 'I can see the first comments on a post' do
      visit user_posts_path(@user)
      expect(page).to have_content('Test comment text')
    end

    it 'I can see how many comments a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('Likes: 0')
    end

    it 'When I click on a post, it redirects me to that post`s show page' do
      visit user_posts_path(@user)
      click_link('Test post title')
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end
