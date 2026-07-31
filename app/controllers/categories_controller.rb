class CategoriesController < ApplicationController
  # GET ALL CATEGORIES
  def index
    categories = Category.all

      render json: categories, status: :ok
  end

  # GET CATEGORY BY ID
  def show
    category = Category.find(params[:id])

      render json: category, status: :ok
  end

  # CREATE NEW CATEGORY
  def create
    category = Category.new(category_params)

    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # UPDATE CATEGORY
  def update
    category = Category.find(params[:id])


      if category.update(category_params)
        render json: category, status: :ok
      else
        render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
      end
  end

  # DELETE CATEGORY
  def destroy
    category = Category.find(params[:id])

      category.destroy
      render json: { message: "Category Deleted Successfully" }, status: :ok
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
