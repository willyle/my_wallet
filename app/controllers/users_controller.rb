class UsersController < ApplicationController
	def edit
		@user = User.find(session[:user_id])
	end

	def update
		user = User.find(session[:user_id])

		if user.update(user_update_params)
			flash[:notice] = "You have updated your profile successfully."
			redirect_to root_path
		else
			flash[:alert] = "There was an error while updating your profile. Please try again."
			redirect_to :back
		end
	end

	def create
		user = User.new(user_create_params)

		if user.save
			session[:user_id] = user.id
			flash[:notice] = "You have created an account successfully."
		else
			flash[:alert] = "An error occurred when creating your account. Please try again."
		end

		redirect_to root_path
	end

	def destroy
		user = User.find_by(user_delete_params)

		if user
			if user.id == session[:user_id]
				session[:user_id] = nil
				session[:admin] = nil
			end

			if user.destroy
				flash[:notice] = "You have deleted a user succesfully."
			else
				flash[:alert] = "There was an error while deleting this user."
			end
		else
			flash[:alert] = "The user, you attempted to delete, does not exist."
		end

		redirect_to root_path
	end
	
	private
		def user_create_params
			params.permit(:email, :email_confirmation, :password, :password_confirmation, :first_name, :last_name, :phone)
		end

		def user_update_params
			params.require(:user).permit(:email, :first_name, :last_name, :phone)
		end

		def user_delete_params
			params.permit(:email)
		end
end
