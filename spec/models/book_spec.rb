require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    book = Book.new(title: "Pride and Prejudice")
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: "")
    expect(book).not_to be_valid
  end

  it "has an author" do
    book = Book.new(
      title: "Pride and Prejudice",
      author: "Jane Austen"
    )
    expect(book.author).to eq("Jane Austen")
  end

  it "has a price" do
    book = Book.new(
      title: "Pride and Prejudice",
      price: 5.99
    )
    expect(book.price).to eq(5.99)
  end

  it "has a published date" do
    date = Date.new(1813, 1, 25)
    book = Book.new(
      title: "Pride and Prejudice",
      published_date: date
    )
  end
end