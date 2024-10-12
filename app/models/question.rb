class Question < ApplicationRecord
  belongs_to :quiz, inverse_of: :questions

  validates :text, presence: true
end
