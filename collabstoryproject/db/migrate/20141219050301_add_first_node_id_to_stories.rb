class AddFirstNodeIdToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :start_node_id, :integer
  end
end
