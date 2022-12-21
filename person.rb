require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :date

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  private

  def of_age?(age)
    true if age >= 18

    false
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name.to_s
  end

  def add_person_rental(date)
    @rental.push(date)
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedperson = CapitalizeDecorator.new(person)
capitalizedperson.correct_name
capitalizedtrimmedperson = Trimmerdecorator.new(capitalizedperson)
capitalizedtrimmedperson.correct_name
