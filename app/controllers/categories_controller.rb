class CategoriesController < ApplicationController
  def index 
    @categories = Category.order('title')
  end

  def show
    #shows one id
    @category = Category.find(params[:id])
  end
end
