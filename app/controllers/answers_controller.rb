class AnswersController < ApplicationController
  before_action :logged_in_user

  def new
    @category = Category.find(params[:category_id])
    @words = @category.words.paginate(page: params[:page], per_page: 1)
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = Lesson.find(params[:lesson_id])
    @answers = @lesson.answers.build(answer_params)

    if @lesson.save
      unless params[:page].empty?
        redirect_to new_category_lesson_answer_url(@category,@lesson, page: params[:page])
      else
        result = 0
        @lesson.answers.each do |answer|
          if answer.choice.correct?
            result += 1
          elsif answer.choice.correct == 0
            result = 0
          end #end of if inside if
          @lesson.update_attribute(:result, result)
          @lesson.update_attribute(:is_completed, true)
        end #end of do
        redirect_to category_lesson_url(@category, @lesson) #redirects if page=>""
      end #end of unless
    end #end of if
  end #end of create


  private
  def answer_params
    params.permit(:word_id, :choice_id, :lesson_id)
  end
end
