require './book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date = Time.now,person, book)
    @date = date
    self.person = person
    self.book = book
  end

  def person=(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end

  def book=(book)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end

end
