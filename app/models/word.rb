class Word < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
