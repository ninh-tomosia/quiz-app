class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
end
