class SessionsController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@cards = @user.cards
	end

	def create
		user = User.find_by(email: params[:email])
		if user
			if user.password == params[:password]
				session[:user_id] = user.id
				flash[:notice] = "You have logged in successfully."
			else
				flash[:alert] = "Your login information was incorrect. Please Try Again."
			end
		else
			flash[:alert] = "Your login information was incorrect. Please Try Again."
		end
			redirect_to root_path
	end

	def destroy
		session[:user_id] = nil

		flash[:notice] = "You have logged out successfully."

		redirect_to root_path
	end
end
