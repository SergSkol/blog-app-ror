class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  def update_comments_counter(post)
    post.comments_counter = Comment.where(post_id: post.id).count
  end
end
