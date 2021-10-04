require_relative 'corrector'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @corrector = Corrector.new
    @id = 1
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private :of_age?
end
