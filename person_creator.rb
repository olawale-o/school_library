require_relative 'student'
require_relative 'teacher'
require_relative 'creator'
require_relative 'screen'

class PersonCreator < Creator
  include 'Screen'
  def initialize(people)
    super()
    @people = people
  end

  def create
    create_person
  end

  def create_person
    key = create_person_screen
    case key
    when 1 then create_student
    else create_teacher
    end
  end

  def create_student
    age, name, permission = create_student_screen
    student = Student.new(age: age, classroom: 'classroom', name: name, parent_permission: !permission)
    @people << student
    puts 'Person created successfully'
  end

  def create_teacher
    age, name, specialization = create_teacher_screen
    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people << teacher
    puts 'Person created successfully'
  end

  private :create_person, :create_teacher, :create_student
end
