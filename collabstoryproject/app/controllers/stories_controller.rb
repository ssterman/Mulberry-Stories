class StoriesController < ApplicationController

	# lists all the stories with links to their interfaces
	def index
		@stories = Story.find(:all)
		@nodes_hash = {}
		for story in @stories do
			conds = "story_id == " + story.id.to_s
			@nodes_hash[story.id] = Node.find(:all, :conditions => conds)
		end
	end

	# displays a single story with visualization and edit interface
	def view
		@story = Story.find(params[:id])
		conds = "story_id == " + @story.id.to_s
		@nodes = Node.find(:all, :conditions => conds)
	end
end
