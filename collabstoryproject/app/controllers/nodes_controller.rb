class NodesController < ApplicationController
	include ActionView::Helpers::TextHelper

	def save
		logger.info "The post was saved and now the user is going to be redirected..."
		parameters = node_params

		new_node = Node.new
		new_node.text = simple_format(parameters[:text])
		new_node.user = User.find_by_id(parameters[:userid])
  		new_node.truth_height = 0
  		new_node.story = Story.find_by_id(parameters[:storyid])
  		new_node.annotation = parameters[:annotation]

  		if parameters[:truth] == "true"
  		  	new_node.truth = true
  		  	new_node.constraint_num = Integer(parameters[:constraint_num]) + 1
  		else
  			new_node.truth = false
  			new_node.constraint_num = Integer(parameters[:constraint_num])
  		end
  		
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
	 	params.permit(:text, :source, :storyid, :userid, :truth, :annotation, :constraint_num)
	 end

end
