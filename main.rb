require_relative 'person_displayer'
require_relative 'book_displayer'
require_relative 'rental_displayer'
require_relative 'book_creator'
require_relative 'person_creator'
require_relative 'rental_creator'
require_relative 'screen'
require_relative 'storage'

class Application
  include Screen

  def initialize
    @storage = Storage.new
    @books = @storage.parse[:books]
    @people = @storage.parse[:people]
    @rentals = @storage.parse[:rentals]
    @book_creator = BookCreator.new(@books)
    @person_creator = PersonCreator.new(@people)
    @rental_creator = RentalCreator.new(@books, @people, @rentals)
    @book_displayer = BookDisplayer.new(@books)
    @people_displayer = PeopleDisplayer.new(@people)
    @rental_displayer = RentalDisplayer.new(@rentals)
  end

  def run
    is_running = true
    while is_running
      show_welcome_screen
      key = user_input.to_i
      if key.eql?(7)
        @storage.stringify(@books, @people, @rentals)
        is_running = false
      else
        handle_all_actions(key)
      end
    end
  end

  private

  def handle_all_actions(key)
    case key
    when 1
      @book_displayer.display
    when 2
      @people_displayer.display
    when 3
      @person_creator.create
    when 4
      @book_creator.create
    when 5
      @rental_creator.create
    when 6
      @rental_displayer.display
    else
      puts 'Please select a number between 1 and 7'
    end
  end
end

def main()
  app = Application.new
  app.run
end

main
