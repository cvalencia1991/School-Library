require './book'
require './person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person)
    @date = date
    @person = person
  end
end
