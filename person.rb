require_relative 'corrector'

class Person
  attr_reader :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @corrector = Corrector.new
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  #  rubocop: disable Style/TrivialAccessors
  def id
    #  rubocop: enable Style/TrivialAccessors
    @id
  end

  #  rubocop: disable Style/TrivialAccessors
  def name
    #  rubocop: enable Style/TrivialAccessors
    @name
  end

  #  rubocop: disable Style/TrivialAccessors
  def age
    #  rubocop: enable Style/TrivialAccessors
    @age
  end

  #  rubocop: disable Style/TrivialAccessors
  def name=(name)
    #  rubocop: enable Style/TrivialAccessors
    @name = name
  end

  #  rubocop: disable Style/TrivialAccessors
  def age=(age)
    #  rubocop: enable Style/TrivialAccessors
    @age = age
  end

  #  rubocop: disable Naming/PredicateName
  def is_of_age?
    #  rubocop: enable Naming/PredicateName
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private :is_of_age?
end
