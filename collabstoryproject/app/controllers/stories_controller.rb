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
		@story = Story.find(params[:id])
		conds = "story_id == " + @story.id.to_s
		@nodes = Node.find(:all, :conditions => conds)

		# form json string with desired fields from database
		nodes_str = "\"nodes\":["
		links_str = "\"links\":["

		for n in @nodes do
			nodes_str += "{\"id\": " + n.id.to_s + ", "
			nodes_str += "\"truth_height\": " + n.truth_height.to_s + ", "
			nodes_str += "\"text\":\"" + n.text + "\","
			nodes_str += "\"truth\": " + n.truth.to_s + "},"
			# get all links starting with this node
			links = Link.find(:all, :conditions => "source == " + n.id.to_s)
			# loop through all the links, add to string based on NODE's INDEX IN ARRAY, not node id
			for l in links do 
				source = @nodes.index(Node.find(l.source))
				links_str += "{\"source\": " +  source.to_s + ","
				target = @nodes.index(Node.find(l.target))
				links_str += "\"target\": " + target.to_s + "},"
			end
		end

		nodes_str = nodes_str.chop
		links_str = links_str.chop
		nodes_str += "]"
		links_str += "]"
		@json_str = "{" + nodes_str + "," + links_str + "}"
		@json_data = JSON.generate(JSON.parse(@json_str)) # turns string to ruby object to JSON
	end

	def save
		logger.info "The post was saved and now the user is going to be redirected..."
		puts "hisfdsf"
		new_node = Node.new
		new_node.id = 4
		new_node.text = "Hello hello!!"
		new_node.user = User.find_by(username: 'Tester1')
  		new_node.truth = false
  		new_node.truth_height = 0
  		new_node.story = Story.find_by(title: "TEST STORY 1")
  		#new_node.save(:validate => false)
  		redirect_to :action => :view, :id => new_node.story
	end
end


# so create new migration of links
# store source, target

#add weight to nodes


