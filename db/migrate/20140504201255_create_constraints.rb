class CreateConstraints < ActiveRecord::Migration
  def change
    create_table :constraints do |t|
    	t.integer :story_id
    	t.string :title
        t.string :text
        t.integer :constraint_num
      t.timestamps
    end
  end
end
