class StoriesController < ApplicationController

	# lists all the stories with links to their interfaces
	def index
		logger.info "D"
		@stories = Story.find(:all)
		@nodes_hash = {}
		for story in @stories do
			conds = "story_id == " + story.id.to_s
			@nodes_hash[story.id] = Node.find(:all, :conditions => conds)
		end
	end

	# displays a single story with visualization and edit interface
	def view
		@node = Node.new
		@link = Link.new
		@story = Story.find(params[:id])
		@nodes = @story.nodes
		@links = @story.links
		@json_data = JSON.generate((_create_object(@story, @nodes, @links)))
		@current_node = params[:current]
		#render json: story_hash, status: 200 and return
	end

	def _create_object(story, nodes, links)
		story_hash = Hash.new
		story_hash["nodes"] = Array.new
		story_hash["links"] = Array.new
		nodes.each do |node|
			node_hash = Hash.new
			node_hash["id"] = node.id
			node_hash["truth_height"] = node.truth_height
			node_hash["text"] = node.text
			node_hash["truth"] = node.truth
			story_hash["nodes"] << node_hash
		end

		links.each do |link|
			link_hash = Hash.new
			link_hash["source"] = @nodes.index(Node.find(link.source))
			link_hash["target"] = @nodes.index(Node.find(link.target))
			story_hash["links"] << link_hash
		end

		return story_hash
	end


	 def new
	 	@story = Story.new

	 end

	 def create


	 end

end



