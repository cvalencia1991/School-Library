require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(*person, classroom)
    super(*person)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
