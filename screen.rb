module Screen
  def user_input
    gets.chomp
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

  def create_book_screen
    print 'Title: '
    title = user_input
    print 'Author: '
    author = user_input
    [title, author]
  end

  def create_person_screen
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    user_input.to_i
  end

  def create_teacher_screen
    print 'Age: '
    age = user_input
    print 'Name: '
    name = user_input
    print 'Specialization: '
    specialization = user_input
    [age, name, specialization]
  end

  def create_student_screen
    print 'Age: '
    age = user_input
    print 'Name: '
    name = user_input
    print 'Has parent permission? [Y/N]: '
    permission = user_input == 'n'
    [age, name, permission]
  end
end
