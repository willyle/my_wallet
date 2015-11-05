class User < ActiveRecord::Base
	validates :email,
				 uniqueness: true,
				 presence: true,
				 confirmation: true

	validates :password,
				 presence: true,
				 length: {minimum: 6},
				 confirmation: true

	validates :phone,
				 format: {with: /\A\d{3}-\d{3}-\d{4}|\d{10}|\d{3}.\d{3}.\d{4}|\d{3}\s\d{3}\s\d{4}\z/, message: "bad format"},
				 presence: true

	validates :first_name,
				 presence: true

	validates :last_name,
				 presence: true

	has_many :user_cards, dependent: :destroy
	has_many :cards, through: :user_cards

	has_many :own_cards, class_name: "Card", foreign_key: "creator_id", dependent: :destroy
end
