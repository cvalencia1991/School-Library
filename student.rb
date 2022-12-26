require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(*person, classroom: 'student')
    super(*person)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

end
