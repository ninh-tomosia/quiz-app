class Subticket < ApplicationRecord
  belongs_to :ticket
  # has_many :questions
end
