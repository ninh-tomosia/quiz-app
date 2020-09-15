class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  has_many   :histories
end
