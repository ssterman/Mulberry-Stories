class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
    	t.string :text
		t.integer :user_id #creator id
		t.integer :story_id
		t.integer :weight  #use to size nodes based on votes/views/something
		t.boolean :truth   #is it a truth node
      t.timestamps
    end
  end
end
