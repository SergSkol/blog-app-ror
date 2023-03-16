module Api
  class Api::PostsController < ApiController
    load_and_authorize_resource

    def index
      @user = User.find(params[:user_id])
      @posts = Post.where(author_id: @user.id).includes(:comments)
      render json: @posts
    end
  end
end
