class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  def update_likes_counter(post)
    post.likes_counter = Like.where(post_id: post.id).count
  end
end
