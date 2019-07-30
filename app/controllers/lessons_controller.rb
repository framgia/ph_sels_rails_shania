class LessonsController < ApplicationController
  before_action :logged_in_user

  def new
    @categories = Category.find(params[:category_id])
    @user = User.find(params[:user_id])
    @lesson = Lesson.new
  end
  
  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)
    if @lesson.save
      @lesson.create_activity(user_id: current_user.id)
      redirect_to new_category_lesson_answer_url(@category, @lesson, page:1 )
    else
      render 'new'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  private
    
  def lesson_params
    params.permit(:category_id).merge(user_id: current_user.id)
  end
end
