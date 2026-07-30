class BooksController < ApplicationController

  # GET ALL BOOKS
  def index
    books = Book.all

    if books.any?
      render json: books
    else
      render json: { message: "No Data Found" }, status: :not_found
    end
  end

  # GET BOOK BY ID
  def show
    book = Book.find_by(id: params[:id])

    if book
      render json: book
    else
      render json: { message: "No Data Found" }, status: :not_found
    end
  end

  # CREATE NEW BOOK
  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # UPDATE BOOK BY ID
  def update
    book = Book.find_by(id: params[:id])

    if book
      if book.update(book_params)
        render json: book
      else
        render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "No Data Found" }, status: :not_found
    end
  end

  # DELETE BOOK BY ID
  def destroy
    book = Book.find_by(id: params[:id])

    if book
      book.destroy
      render json: { message: "Book Deleted Successfully" }
    else
      render json: { message: "Book Not Found" }, status: :not_found
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :price,
      :published_year,
      :available,
      :category_id
    )
  end

end