require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'GET request to index' do
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

      get "/users/#{@user.id}/posts"
    end

    it 'response status is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render a correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a list of posts')
    end
  end

  context 'GET request to index' do
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

      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'response status is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render a correct template' do
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a details of post')
    end
  end
end
