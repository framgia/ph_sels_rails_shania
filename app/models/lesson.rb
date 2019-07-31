class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :words, through: :answers
  has_one :activity, as: :action, dependent: :destroy

  validates :user_id, presence: true
  validates :category_id, presence: true
end
