require './decorator'

class Capitalize_Decorator < Decorator

  def initialize(decorator,capitaplize)
    super()
    @nameable = capitalize
  end

  def correct_name
   @nameable.correct_name.capitalize
  end
end
