module SessionsHelper
	def full_name person
		person.first_name + " " + person.last_name
	end

	def total_balance cards
		total = 0
		cards.each do |card|
			total += card.cash_balance
		end
		total
	end
end
