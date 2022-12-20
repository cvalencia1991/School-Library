require './nameable'

class Decorator < Nameable
  def initialize(decorator)
    super()
    @nameble = decorator
  end

  def correct_name
    @nameable.to_s
  end
end
