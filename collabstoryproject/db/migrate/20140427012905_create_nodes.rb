class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
    	t.string :text
		t.integer :user_id #creator id
		t.integer :story_id
      t.timestamps
    end
  end
end
