class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = 1
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  #  rubocop: disable Naming/PredicateName
  def is_of_age?
    #  rubocop: enable Naming/PredicateName
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if is_of_age || @parent_permission

    false
  end

  private :is_of_age
end
