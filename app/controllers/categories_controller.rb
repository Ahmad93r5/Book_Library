class CategoriesController < ApplicationController

  # GET ALL CATEGORIES
  def index
    categories = Category.all

    if categories.any?
      render json: categories, status: :ok
    else
      render json: { message: "No Data Found" }, status: :not_found
    end
  end

  # GET CATEGORY BY ID
  def show
    category = Category.find_by(id: params[:id])

    if category
      render json: category, status: :ok
    else
      render json: { message: "Category Not Found" }, status: :not_found
    end
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
    category = Category.find_by(id: params[:id])

    if category
      if category.update(category_params)
        render json: category, status: :ok
      else
        render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Category Not Found" }, status: :not_found
    end
  end

  # DELETE CATEGORY
  def destroy
    category = Category.find_by(id: params[:id])

    if category
      category.destroy
      render json: { message: "Category Deleted Successfully" }, status: :ok
    else
      render json: { message: "Category Not Found" }, status: :not_found
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end