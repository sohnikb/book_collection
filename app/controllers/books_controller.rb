class BooksController < ApplicationController
    def index
        # retrieves all books from the db
        @books = Book.all
    end

    # creates a new book
    def new
        @book = Book.new
    end

    # creates a new book with parameters
    def create
        @book = Book.new(book_params)

        if @book.save
            # flash message
            redirect_to root_path, notice: "Book was successfully added."
        else
            render :new
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    # doesn't actually edit, shows the message
    def edit
        @book = Book.find(params[:id])
    end

    # this actually updates
    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to root_path, notice: "Book was successfully updated."
        else
            render :edit
        end
    end

    # doesn't actually delete, shows the message
    def delete
        @book = Book.find(params[:id])
    end

    # this actually deletes
    def destroy
        @book = Book.find(params[:id])
        @book.destroy

        redirect_to root_path, notice: "Book was successfully deleted."
    end

    private

    def book_params
        params.require(:book).permit(:title)
    end
end
