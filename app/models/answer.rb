class Answer < ApplicationRecord
  belongs_to :word
  belongs_to :choice
  belongs_to :lesson

  default_scope -> { order(created_at: :desc) }

  validates :word_id, presence: true
  validates :choice_id, presence: true
  validates :lesson_id, presence: true
end