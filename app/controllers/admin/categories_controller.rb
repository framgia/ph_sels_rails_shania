module Admin
  class CategoriesController < ApplicationController
    before_action :check_admin_user, only: [:index]

      def index
        # show all
        @categories = Category.all
      end

      def show
        #shows one id
        @category = Category.find(params[:id])
      end

      def new
        @category = Category.new
      end

      def create
        @category = Category.new(category_params)
          if @category.save
            redirect_to admin_categories_url
          else
            render 'new'
          end
      end

      def edit
        @category = Category.find(params[:id])
      end

      def update
        @category = Category.find(params[:id])
        if @category.update_attributes(category_params)
          flash[:success] = "Category updated!"
          redirect_to admin_categories_url
        else
          render 'edit'
        end
      end

      def destroy
        Category.find(params[:id]).destroy
        flash[:success] = "Category deleted"
        redirect_to admin_categories_url
      end

      private
      def category_params
        params.require(:category).permit(:title, :description)
      end

      def check_admin_user
        redirect_to(root_url) unless current_user.admin?
      end
  end
end