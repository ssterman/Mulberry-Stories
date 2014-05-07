class LinksController < ApplicationController
	def save_link
		new_link = Link.new
		new_link.source = params[:link][:source]
		new_link.target = params[:link][:target]
		new_link.save
		story = Story.find_by_id(params[:link][:story_id])
		story.links << new_link
  		story.save
		redirect_to :controller => 'stories', :action => :view, :id => story
	end
end
