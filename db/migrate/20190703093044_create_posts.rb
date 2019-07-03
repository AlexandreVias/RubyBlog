class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :kicker
      t.string :body
      t.string :img
      t.integer :user_id
      t.timestamps
    end
  end
end
