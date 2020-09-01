class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :questions
  has_many   :subtickets
  has_many   :user_tickets
  has_many   :users, through: :user_tickets
end
