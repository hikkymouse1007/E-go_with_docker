class CreateUserArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_articles do |t|
      t.integer "user_id"
      t.integer "category_id"
      t.string "title"
      t.text "content"
      t.text "url"
      t.string "published_at"

      t.timestamps
    end
  end
end

