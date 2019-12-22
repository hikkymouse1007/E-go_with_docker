	class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string "source_id"
	  t.string "name"
	  t.text "description"
	  t.text "url"
	  t.string "category"
	  t.string "language"
	  t.string "country"
	  t.timestamps
    end
  end
end
