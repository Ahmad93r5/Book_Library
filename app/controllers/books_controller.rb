class BooksController < ApplicationController
  # GET ALL BOOKS
  def index
    books = Book.order(id: :asc)

      render json: books
  end

  #  Get By ID
  def show
    book = Book.find(params[:id])

      render json: book
  end

 #   Get By NAME
 def show_by_name
  book = Book.find_by!(title: params[:name])
  render json: book
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
    book = Book.find(params[:id])


     if book.update(book_params)
        render json: book
     else
        render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
     end
  end

  # DELETE BOOK BY ID
  def destroy
    book = Book.find(params[:id])

      book.destroy
      render json: { message: "Book Deleted Successfully" }
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
