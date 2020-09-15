class History < ApplicationRecord
	belongs_to 	:user_ticket
	belongs_to	:question
	belongs_to	:answer
end
