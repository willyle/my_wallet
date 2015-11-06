class CardsController < ApplicationController
	def create
		card = Card.new(card_params)
		card.card_type = determine_type
		card.creator_id = session[:user_id]

		if card.save
			UserCard.create(user_id: session[:user_id], card_id: card.id)
			flash[:notice] = "You have added a card successfully."
		else
			flash[:alert] = "There was an error while adding a new card. Please try again."
		end

		redirect_to root_path
	end

	def update
		@card = Card.find(params[:id])
		@card.cash_balance += 1
		@card.save
	end

	private
		def card_params
			params.require(:card).permit(:card_number, :exp_month, :exp_year, :cash_balance)
		end

		def determine_type
			if params[:card][:card_number][0] == '4'
				return type = "Visa"
			elsif params[:card][:card_number][0] == '5'
				return type = "Mastercard"
			elsif params[:card][:card_number][0] == '6'
				return type = "Discover"
			elsif params[:card][:card_number][0] == '3'
				return type = "Amex"
			end
		end


end
