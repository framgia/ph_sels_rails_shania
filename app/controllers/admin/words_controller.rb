module Admin
  class WordsController < ApplicationController
    def index
      # show all
      @category = Category.find(params[:category_id])
      @words = @category.words
    end

    def show
      #shows one id
      @word = Word.find(params[:id])
    end

    def new
      @category = Category.find(params[:category_id])
      @word = @category.words.build
      3.times do
         @word.choices.build
      end
    end

    def create
      @category = Category.find(params[:category_id])
      @word = @category.words.build(word_params)
      if @word.save
        flash[:success] = "Word created!"
        redirect_to admin_category_words_url
      else
        render 'new'
      end
    end

    def edit
      @category = Category.find(params[:category_id])
      @word = Word.find(params[:id])
    end

    def update
      @category = Category.find(params[:category_id])
      @word = Word.find(params[:id])
      if @word.update_attributes(word_params)
        flash[:success] = "Word updated!"
        redirect_to admin_category_words_url(@word.category_id)
      else
        render 'edit'
      end
    end

    def destroy
      Word.find(params[:id]).destroy
      flash[:success] = "Word deleted"
      redirect_to admin_category_words_url
    end

    private
    def word_params
      params.require(:word).permit(:name,
        choices_attributes: [ :id, :content, :correct ])
    end
  end
end