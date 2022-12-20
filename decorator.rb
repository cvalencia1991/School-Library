require './nameable'

class Decorator < Nameable
  def initialize(decorator)
    super()
    @nameable = decorator
  end

  def correct_name
    @nameable.correct_name
  end
end
