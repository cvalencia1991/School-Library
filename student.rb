require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(*person, classroom)
    super(*person)
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
