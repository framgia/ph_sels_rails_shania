class CategoriesController < ApplicationController
  def index 
    @lesson = Lesson.new
    @filter = Category.order('title')

    @categories = []
    @filter.each do |category|
      if category.words.any?
        @categories << category
      end
    end
  end

  def show
    #shows one id
    @category = Category.find(params[:id])
  end
end
