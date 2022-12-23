require './book'

class Rentals
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.rentals << self unless book.rentals.include?(self)
    person.rentals << self unless person.rentals.include?(self)
  end
end
