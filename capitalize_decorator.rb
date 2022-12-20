require './decorator'

class Capitalizedecorator < Decorator
  def initialize(_decorator, _capitaplize)
    super()
    @nameable = capitalize
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
