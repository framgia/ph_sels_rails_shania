class Choice < ApplicationRecord
  belongs_to :word
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 140 }, uniqueness: true
end
