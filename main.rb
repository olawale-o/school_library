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

  
end

def main()
  app = Application.new
  app.run
end

main
