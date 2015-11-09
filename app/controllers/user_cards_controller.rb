class UserCardsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		card = Card.find(params[:card_id])

		if card.creator_id == session[:user_id] || session[:admin]
			if user
				UserCard.create(user_id: user.id, card_id: card.id)
				flash[:notice] = "You have authorized a user successfully."
			else
				flash[:alert] = "The user, you attempted to authorize, does not exist."
			end
		else
			flash[:alert] = "You have no authority to authorize a user on this card. Nice try buddy!"
		end

		redirect_to root_path
	end
end
