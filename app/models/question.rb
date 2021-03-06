class Question < ApplicationRecord
  has_many :answers
  validates :title, presence: true
  validates :description, presence: true
  validates :title, length: { minimum: 40 }
  validates :description, length: { minimum: 150 }

end
