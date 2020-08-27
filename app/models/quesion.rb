class Quesion < ApplicationRecord
  belongs_to :ticket
  has_many   :answers
end
