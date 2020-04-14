class Post < ApplicationRecord
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  with_options presence: true do
    validates :title, presence: true
    validates :review, presence: true
    # validates :p.id, presence: true
    # - post.genres.each do |p|
    #   validates :p.id, presence: true
    # end
  end
end
