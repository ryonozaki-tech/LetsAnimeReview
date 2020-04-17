class Post < ApplicationRecord
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  # ratyrate_rateable "review"

  with_options presence: true do
    validates :title, presence: true
    validates :review, presence: true
    validates :rate, numericality: {
      less_than_or_equal_to: 5,
      greater_than_or_equal_to: 1
    }, presence: true
    # validates :rate
  end
  
  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%").order("created_at DESC")
  end
end
