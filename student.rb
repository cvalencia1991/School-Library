require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  # def initialize(*person, classroom: 'student')
  #   super(*person, classroom)
  #   @classroom = classroom
  # end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
