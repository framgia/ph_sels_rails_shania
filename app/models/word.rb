class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers

  accepts_nested_attributes_for :choices
  validates :category_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validate :must_have_one_item
  validate :unique

  def word_choices
    choices.find_by(correct: true).content
  end

  def unique
    u = choices.uniq { |choice| choice.content }.length
    choice_length = choices.length
    if u < choice_length
      errors.add(:choice, 'Must have unique choices!')
    end
  end

  private
  def must_have_one_item
    correct_counter = choices.collect { |c| c.correct }.count(true)
    if correct_counter  > 1
      errors.add(:choice, 'Must have only one correct answer')
    elsif  correct_counter  == 0
      errors.add(:choice, 'Must have one correct answer')
    end
  end

end
