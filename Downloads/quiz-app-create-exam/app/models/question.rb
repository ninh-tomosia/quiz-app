class Question < ApplicationRecord
  has_many :answers
  belongs_to :ticket
  has_many  :histories
  belongs_to :subticket
end
