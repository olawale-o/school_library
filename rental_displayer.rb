require_relative 'displayer'

class RentalDisplayer < Displayer
  def initialize(rentals)
    super()
    @rentals = rentals
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
    @rentals.each do |rental|
      if rental.person.id.eql?(person_id)
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      else
        puts ''
      end
    end
  end

  private :list_rentals_by_id
end
