class Post < ApplicationRecord
  has_many :genre_posts
  has_many :genres, through: :genre_posts
  belongs_to :user
  with_options presence: true do
    validates :title, presence: true
    validates :review, presence: true
    # validates :genre_id, presence: true
  end
end
