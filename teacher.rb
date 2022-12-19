require_relative 'person'

class Teacher < Person
  super(specialization)
  @specialization = specialization

  def can_use_services?
    true
  end
end
