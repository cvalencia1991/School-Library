require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom
  attr_reader :students

  def initialize(*person, classroom, type: 'student')
    super(*person)
    @type = type
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
