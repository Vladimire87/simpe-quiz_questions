class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy, inverse_of: :quiz

  validates :title, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true

  validate :must_have_at_least_one_question

  private

  def must_have_at_least_one_question
    if questions.reject(&:marked_for_destruction?).empty?
      errors.add(:base, "Quiz must have at least one question")
    end
  end
end
