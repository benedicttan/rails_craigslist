class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :category, index: true
      t.string :title
      t.text :description
      t.string :email

      t.timestamps null: false
    end
    add_foreign_key :posts, :categories
  end
end
