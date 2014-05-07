class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.integer :story_id
    	t.integer :source  #where the link starts (node id)
    	t.integer :target  #where the link ends (node id)

      t.timestamps
    end
  end
end
