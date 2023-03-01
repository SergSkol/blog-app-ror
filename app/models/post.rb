class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter()
    user = User.find_by(id: author_id)
    user.post_counter = Post.where(author_id:).count
    user.save
  end

  def recent_comments()
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
