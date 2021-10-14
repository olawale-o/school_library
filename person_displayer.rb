require_relative 'displayer'

class PeopleDisplayer < Displayer
  def initialize(people)
    super()
    @people = people
  end

  def display
    super
    list_people
  end

  def list_people
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}" }
  end

  private :list_people
end
