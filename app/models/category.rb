class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 },
              uniqueness: { case_sensitive: false }
end
