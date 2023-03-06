require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'GET request to index' do
    before(:example) do
      get '/users/1/posts'
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

  context 'GET request to show' do
    before(:example) do
      get '/users/1/posts/1'
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
