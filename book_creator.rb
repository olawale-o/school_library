require_relative 'creator'
require_relative 'book'
require_relative 'screen'

class BookCreator < Creator
  include Screen
  attr_accessor :books

  def initialize(books)
    super()
    @books = books
  end

  def create
    create_book
  end

  def create_book
    title, author = create_book_screen
    book = Book.new(title: title, author: author)
    @books << book
    puts 'Book created successfully'
  end

  private :create_book
end
