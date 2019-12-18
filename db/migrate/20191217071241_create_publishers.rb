class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string "source_id"
	  t.string "name"
	  t.string "description"
	  t.string "url"
	  t.string "category"
	  t.string "language"
	  t.string "country"
	  t.timestamps

	  drop_table :categories
    end
  end
end
