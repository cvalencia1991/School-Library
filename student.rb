require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  classroom.students.push(self) unless classroom.students.include?(self)

  def initialize(*person, classroom)
    super(*person)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
