require 'rails_helper'

RSpec.describe 'On post view', type: :system do
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

      @comment = Comment.create!(text: 'Test comment text',
                                 author_id: @user.id,
                                 post_id: @post.id)
    end

    it 'I can see a post title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Test post title')
    end

    it 'I can see who wrote the post' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('by Sergiy')
    end

    it 'I can see how many comments a post has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes a post has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Likes: 0')
    end

    it 'I can see the post body.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Test post text')
    end

    it 'I can see the username of each commentor.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Sergiy:')
    end

    it 'I can see the comment each commentor left.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Test comment text')
    end
  end
end
