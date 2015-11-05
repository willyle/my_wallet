class Card < ActiveRecord::Base
	validates :card_number,
				 uniqueness: true,
				 format: {with: /\A(3[4,7][0-9]{13}|4([0-9]{12}|[0-9]{15})|6011[0-9]{12}|65[0-9]{14}|5[1-5]{1}[0-9]{14}|\b622(1(2[6-9][0-9]{10}|[3-9][0-9]{11})|[2-8][0-9]{12}|9([01][0-9]{11}|2[0-5][0-9]{10}))\b)\z/, message: "Enter a valid Amex, Visa, Discover, or Mastercard"}

	validates :card_type,
				 presence: true;

	validates :exp_month,
				 presence: true,
				 numericality: {greater_than: 0, less_than: 13} 
				 
	validates :exp_year,
				 presence: true,
				 numericality: {greater_than_or_equal: Time.now.strftime('%Y').to_i}

	validates :cash_balance,
	          numericality: {greater_than_or_equal_to: 0}

	validates :creator_id,
				 presence: true
				 
	has_many :user_cards, dependent: :destroy
	has_many :users, through: :user_cards

	belongs_to :owner, class_name: "User", foreign_key: "creator_id"
end
