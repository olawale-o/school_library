require_relative 'displayer'

class BookDisplayer < Displayer
  def initialize(books)
    super()
    @books = books
  end

  def display
    super
    list_all_books
  end

  def list_all_books
    @books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  private :list_all_books
end
