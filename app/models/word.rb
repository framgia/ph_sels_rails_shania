class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  validates :category_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validate :must_have_one_item

  def must_have_one_item
    trueCounter = 0
    for choice in choices
      puts choice.correct
        if choice.correct == true
          trueCounter+=1
        end
    end
    puts trueCounter
    if trueCounter > 1
      errors.add(:choice, 'Must have only one correct answer')
    elsif trueCounter == 0
      errors.add(:choice, 'Must have one correct answer')
    end
  end
end
