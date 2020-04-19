class Like < ApplicationRecord
  belongs_to :post, counter_cache: :likes_count
  belongs_to :user

  validates :post_id, presence: true
  validates :user_id, presence: true
end
