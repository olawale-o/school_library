require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Application
  def initialize
    @books = []
    @people = []
  end

  def show_welcome_screen
    puts "Welcome to school Library App!\n\n"
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def user_input
    gets.chomp
  end

  def list_all_books
    @books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book
    print 'Title: '
    title = user_input
    print 'Author: '
    author = user_input
    book = Book.new(title: title, author: author)
    @books << book
    puts 'Book created successfully'
  end

  def list_people
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    key = user_input.to_i
    handle_create_person_action(key)
  end

  def create_student
    print 'Age: '
    age = user_input
    print 'Name: '
    name = user_input
    print 'Has parent permission? [Y/N]: '
    permission = user_input == 'n'
    student = Student.new(age: age, classroom: 'classroom', name: name, parent_permission: !permission)
    puts 'Person created successfully'
    @people << student
  end

  def create_teacher
    print 'Age: '
    age = user_input
    print 'Name: '
    name = user_input
    print 'Specialization: '
    specialization = user_input == 'n'
    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    puts 'Person created successfully'
    @people << teacher
  end

  def rentals_by_id
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
    Rental.new(date, person, book)
    puts 'Rental created sccessfully'
  end

  def run
    is_running = true
    while is_running
      show_welcome_screen
      key = user_input.to_i
      if key.eql?(7)
        is_running = false
      else
        handle_all_actions(key)
      end
    end
  end

  def handle_all_actions(key)
    case key
    when 1
      list_all_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rentals_by_id
    else
      puts 'Please select a number between 1 and 7'
    end
  end

  def handle_create_person_action(key)
    case key
    when 1
      create_student
    else
      create_teacher
    end
  end
end

def main()
  app = Application.new
  app.run
end

main
