require_relative 'rental'
require_relative 'creator'
require_relative 'screen'

class RentalCreator < Creator
  include Screen
  def initialize(books, people,rentals)
    super()
    @books = books
    @people = people
    @rentals = rentals
  end

  def create
    create_rental
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_index { |index| puts "#{index}) Title: #{@books[index].title}, Author: #{@books[index].author}" }
    selected_book_number = user_input.to_i
    book = @books[selected_book_number]
    puts 'Select a person from the following list by number (not id)'
    @people.each_index do |index|
      print "#{index}) [#{@people[index].class}] Name: #{@people[index].name}, ID: #{@people[index].id}, "
      print "Age: #{@people[index].age} \n"
    end
    selected_person_number = user_input.to_i
    person = @people[selected_person_number]
    print 'Date: '
    date = user_input.to_i
    @rentals << Rental.new(date, person, book)
    puts('Rental created successfully')
  end

  private :create_rental
end
