require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(*person, classroom)
    super(*person)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
