require './nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.range(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

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
end
