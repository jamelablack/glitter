class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by username: params[:username]
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "You're logged in!"
			redirect_to statuses_path

		else
			flash.now[:error] = "There is something wrong with your username or password."
			render :new
		end
	end


	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've logged out."
		redirect_to login_path
	end
end