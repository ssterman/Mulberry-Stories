class NodesController < ApplicationController
	def save
		logger.info "The post was saved and now the user is going to be redirected..."
		parameters = node_params

		new_node = Node.new
		new_node.text = parameters[:text]
		new_node.user = User.find_by(username: 'Tester1')
  		new_node.truth = false
  		new_node.truth_height = 0
  		new_node.story = Story.find_by_id(parameters[:story_id])
  		new_node.save

  		new_node.story.nodes << new_node

  		link = _create_link(parameters[:source], new_node.id)

  		new_node.story.links << link
  		new_node.story.save
  		
  		new_node.save(:validate => false)
  		redirect_to :controller => 'stories', :action => :view, :id => new_node.story
	end

	def _create_link(source, target)
		new_link = Link.new
		new_link.source = source
		new_link.target = target
		new_link.save
		return new_link
	end

	def node_params
		params.require(:node).permit(:text, :source, :story_id)
	end

end
