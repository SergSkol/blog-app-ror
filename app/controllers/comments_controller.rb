class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post: @post)

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
      format.json { head :no_content }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment saved successfully'
          redirect_to user_post_path(@user, @post)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { comment: @comment }
        end
      end

      format.json do
        if @comment.save
          render json: { comment: @comment }, status: :created
        else
          render json: { errors: @comment.errors }, status: :unprocessable_entity
        end
      end
    end
  end

  def comment_params
    @post = Post.find(params[:post_id])
    params.require(:comment)
      .permit(:text)
      .merge(author_id: current_user.id, post_id: @post.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Error: Comment could not be deleted'
    end
  end
end
