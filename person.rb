require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :date

  def initialize(age, name, parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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
    @rentals.push(date)
  end
end
