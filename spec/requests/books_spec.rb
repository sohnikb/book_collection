require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    # sunny day test for adding a book successfully
    # checks database will have one more book
    it "adds a book successfully" do
      expect {
        post books_path, params: {
          book: {
            title: "Pride and Prejudice"
          }
        }
      }.to change(Book, :count).by(1)

      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("Book was successfully added.")
    end

    # rainy day test for adding a book with an empty title
    # checks count of books doesn't change
    it "does not add a book when the title is blank" do
      expect {
        post books_path, params: {
          book: {
            title: ""
          }
        }
      }.not_to change(Book, :count)

      expect(response).to have_http_status(:ok)
      expect(flash[:notice]).to eq("Book could not be added.")
    end

    # sunny day test for adding a book with an author
    it "saves the author" do
        expect {
            post books_path, params: {
                book: {
                    title: "Pride and Prejudice",
                    author: "Jane Austen"
                }
            }
        }.to change(Book, :count).by(1)

        book = Book.last

        expect(book.author).to eq("Jane Austen")
    end

    it "saves the price" do
        expect {
            post books_path, params: {
                book: {
                    title: "Pride and Prejudice",
                    price: 5.99
                }
            }
        }.to change(Book, :count).by(1)

        book = Book.last

        expect(book.price).to eq(5.99)
    end

    it "saves the published date" do
        expect {
            post books_path, params: {
                book: {
                    title: "Pride and Prejudice",
                    published_date: "1813-01-28"
                }
            }
        }.to change(Book, :count).by(1)

        book = Book.last

        expect(book.published_date).to eq(Date.new(1813, 1, 28))
    end
  end
end