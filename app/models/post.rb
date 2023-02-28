class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def update_post_counter(user)
    user.post_counter = Post.where(author_id: user.id).count
  end

  def recent_comments()
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
