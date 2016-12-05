class Answer < ApplicationRecord
  belongs_to :question
  validates :description, presence: true
  validates :description, length: { minimum: 50 }
end
