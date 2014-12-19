class ChangeStringFieldsToText < ActiveRecord::Migration
  def up
  	change_column :constraints, :title, :text

  	change_column :constraints, :text, :text

  	change_column :nodes, :text, :text

  	change_column :stories, :summary, :text

  end

  def down

  end

end
