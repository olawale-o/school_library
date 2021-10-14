





require_relative 'displayer'

class RentalDisplayer < Displayer
  def initialize(books, people)
    super()
    @books = books
    @people = people
  end

  def display
    super
    list_rentals_by_id
  end

  def list_rentals_by_id
    print 'ID of the person: '
    person_id = user_input.to_i
    puts "\n"
    puts 'Rentals:'
    @people.each do |person|
      person.id.eql?(person_id) && person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  private :list_rentals_by_id
end
