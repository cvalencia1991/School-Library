require './book'
require './person'

class Rentals
  attr_accessor :date, :book, :person

  def initialize(date, person)
    @date = date
    @person = person
  end

  book.rentals << self
  person.rentals << self
end
