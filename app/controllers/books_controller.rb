class BooksController < ApplicationController

    #GET ALL BOOKS
    def index
        books = Book.all
        render json: books

    end
    
    #GET BY ID
    def show
        book = Book.find(params[:id])
        render json: book

      
    end

    #POST CREATE NEW BOOK
    def create
        book = Book.create(book_params)
        render json: book
    end

    
    #UPDATE BOOK BY ID
    def update
        book = Book.find(params[:id])

        if book.update(book_params)
        render json: book
        end

    end
    
    #DELETE BOOK BY ID
    def destroy
        book = Book.find(params[:id])
         book.destroy
        render json: book
    end  
    
       private 
       def book_params
        params.require(:book).permit(:title, :author, :price, :published_year, :available)
       end

end
