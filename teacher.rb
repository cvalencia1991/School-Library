require './person'

require_relative './person'

class Teacher < Person


  def initialize( age, name,specialization,parent_permission: true, type: 'Teacher')
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
    @type = type
  end

  def can_use_services?
    true
  end
end
