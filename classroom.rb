require './student'

class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @student = []
  end

  def add_stutend(student)
    @student.push(student)
    student.classroom = self
  end
end
