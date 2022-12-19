require_relative 'person'

class Student < Person
  super(classroom)
  @classroom = classroom

  def play_hooky
    '¯\(ツ)/¯'
  end
end
