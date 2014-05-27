class StoriesController < ApplicationController
	include ActionView::Helpers::TextHelper

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
		@constraints = @story.constraints 
		@links = @story.links
		@json_data = JSON.generate((_create_object(@story, @nodes, @links, @constraints)))
		@current_node = params[:current]
		#render json: story_hash, status: 200 and return
	end

	def _create_object(story, nodes, links, constraints)
		story_hash = Hash.new
		story_hash["nodes"] = Array.new
		story_hash["links"] = Array.new
		story_hash["constraints"] = Array.new
		nodes.each do |node|
			node_hash = Hash.new
			node_hash["id"] = node.id
			# node_hash["truth_height"] = node.truth_height
			node_hash["text"] = node.text
			node_hash["truth"] = node.truth
			node_hash["annotation"] = node.annotation
			node_hash["constraint_num"] = node.constraint_num
			story_hash["nodes"] << node_hash
		end

		links.each do |link|
			link_hash = Hash.new
			link_hash["source"] = @nodes.index(Node.find(link.source))
			link_hash["target"] = @nodes.index(Node.find(link.target))
			story_hash["links"] << link_hash
		end

		constraints.each do |constraint|
			constraint_hash = Hash.new
			constraint_hash["title"] = constraint.title
			constraint_hash["text"] = constraint.text
			constraint_hash["constraint_num"] = constraint.constraint_num
			story_hash["constraints"] << constraint_hash
		end

		return story_hash
	end


	 def new
	 	@story = Story.new
	 	node = @story.nodes.build
	 	5.times do
    		constraint = @story.constraints.build
    	end

	 end

	 def create
	 	@story = Story.new

	 	@story.title = params[:story][:title]
	 	@story.summary = params[:story][:summary]
	 	@story.genre = params[:story][:genre]
	 	@story.user_id = session[:id]
	 	@story.save

	 	count = 1
	 	constraints = params[:story][:constraints_attributes]
	 	constraints.each do |n|
	 		@constraint = Constraint.new
	 		@constraint.text = simple_format(n[1][:text])
	 		@constraint.title = simple_format(n[1][:title])
	 		if @constraint.text != "<p></p>"
		 		@constraint.story_id = @story.id
		 		@constraint.constraint_num = count
		 		@constraint.save
		 		@story.constraints << @constraint
		 		@story.save
		 		count += 1
		 	end
	 	end

	 	count = 0
	 	nodes = params[:story][:nodes_attributes]
	 	nodes.each do |n|
	 		@node = Node.new
	 		@node.text = simple_format(n[1][:text])
	 		@node.user_id = session[:id]
	 		@node.story_id = @story.id
	 		@node.truth = true
	 		@node.annotation = ""
	 		@node.constraint_num = 0
	 		@node.truth_height = count
	 		count +=1
	 		@node.save
	 	end


	 	redirect_to(:action => :index)
	 end

	 def getdata
		@story = Story.find(params[:id])
		@nodes = @story.nodes
		@constraints = @story.constraints 
		@links = @story.links
		@json_data = JSON.generate((_create_object(@story, @nodes, @links, @constraints)))
	end

end



