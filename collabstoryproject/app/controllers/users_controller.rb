class UsersController < ApplicationController
	def login
		flash[:alert] = nil
		if params[:login_msg]
			flash[:alert] = params[:login_msg]
		end
		if session[:id] != nil
			flash[:alert] = "You're already logged in. You don't need to enter your information again."
		end
	end

	def logout
		reset_session
		redirect_to :action => :login
	end

	def post_login
		reset_session
		@user = User.find_by_username(params[:login_val])
		if !@user
			@user = User.new
			@user.username = params[:login_val]
			flash[:user] = @user
			flash[:alert] = "Sorry. Your username does not exist. Please register, and then try again."
			render :action => :login
		elsif params[:password_val].blank? or !@user.password_valid?(params[:password_val])
			@user = User.new
			@user.username = params[:login_val]
			flash[:user] = @user
			flash[:alert] = "Sorry. Your password is incorrect. Please try again."
			render :action => :login
		else
			session[:id] = @user.id
			redirect_to :controller => 'stories', :action => :index
		end
	end

	def create
		user = User.new
		user.first_name = params[:user][:first_name]
		user.last_name = params[:user][:last_name]
		user.test_group = params[:user][:test_group]
		user.username = params[:user][:username]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_confirmation]
		if (!user.valid?)
			flash[:user] = user
			render :action => "../users/new"
		else
			user.save
			flash[:alert] = "Thank you for registering. Please login now."
			render :action => "login"
		end
	end

	def index
		@users = User.all
	end

	def view
		if (!User.exists?(params[:id])) 
			redirect_to :controller => "users", :action => "index"
		else
			@user = User.find(params[:id])
			@authored = Story.where("user_id = '" + @user.id.to_s + "'")
			@contributed = Node.where("user_id = '" + @user.id.to_s + "'")
		end
		# @contributed = []
		# for n in nodes do 
		# 	@contributed.push(Story.find(n.story_id))
		# end

	end
end
