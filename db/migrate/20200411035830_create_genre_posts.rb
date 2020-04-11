class CreateGenrePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :genre_posts do |t|
      t.references  :genre, foreign_key: true
      t.references  :post, foreign_key: true
      t.timestamps
    end
  end
end
