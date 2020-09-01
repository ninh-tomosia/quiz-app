class Question < ApplicationRecord
  belongs_to :ticket
  has_many   :answers
  belongs_to :subticket
end
