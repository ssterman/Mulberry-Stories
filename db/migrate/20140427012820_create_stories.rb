class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
		t.integer :user_id #creator id
		t.string :summary
		t.string :title
		t.string :genre
		t.integer :test_group
      t.timestamps
    end
  end
end
