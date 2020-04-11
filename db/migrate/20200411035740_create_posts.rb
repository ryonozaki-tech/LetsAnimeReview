class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string  :title, null: false
      t.text  :review, null: false
      t.text :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
