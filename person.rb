require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    @rentals.push(Rental.new(date, book, self))
  end

  def correct_name
    @name.to_s
  end

  private

  def of_age?(age)
    true if age >= 18

    false
  end


end
