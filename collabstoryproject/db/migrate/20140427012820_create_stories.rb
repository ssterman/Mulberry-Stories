class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
		t.integer :user_id #creator id
		t.string :summary
		t.string :title
		t.string :genre
      t.timestamps
    end
  end
end
