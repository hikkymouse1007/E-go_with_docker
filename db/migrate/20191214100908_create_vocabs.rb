class CreateVocabs < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabs do |t|
      t.string 'english'
      t.string 'japanese'
      t.integer 'user_article_id'

      t.timestamps
    end
  end
end
