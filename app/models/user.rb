class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes

  after_initialize :init

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts()
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end
end

def init
  return unless post_counter.nil?

  self.post_counter = 0
end
