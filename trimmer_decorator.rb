require './decorator'

class TrimmerDecorator < Decorator
  def initialize(decorator)
    super()
    @nameble = decorator
  end

  def correct_name
    if @nameable.correct_name.length <= 10
      @nameable.to_s
    else
      @nameable.strip
    end
  end
end
