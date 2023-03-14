require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  context 'GET request to index' do
    before(:example) do
      get '/users'
    end

    it 'response status is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render a correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  context 'GET request to show' do
    before(:example) do
      @user = User.create!(name: 'Sergiy',
                           photo: 'https://picsum.photos/id/0/5000/3333',
                           bio: 'Student of Microverse',
                           post_counter: 0)

      get "/users/#{@user.id}"
    end

    it 'response status is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render a correct template' do
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a details of user')
    end
  end
end
