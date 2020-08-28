class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :questions
  has_many   :subtickets
end
