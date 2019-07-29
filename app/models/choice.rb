class Choice < ApplicationRecord
  belongs_to :word
  has_many :answers

  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, uniqueness: true, length: { maximum: 140 }
end
