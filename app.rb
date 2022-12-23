require './book'
require './rental'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def menu
    puts 'Please choose an option by enterin a number:'
    puts "
    1 - List all Books\n
    2 - List all people\n
    3 - Create a Person\n
    4 - Create Book\n
    5 - Create a rental\n
    6 - List all Rentals for a given person id\n
    7 - Exit\n"
  end

  def run
    puts 'Welcome to School Library App!'
    actions = {
      1 => :booksall, 2 => :people_all,
      3 => :new_person, 4 => :new_book,
      5 => :create_rental, 6 => :list_rentals,
      7 => :exit
    }
    loop do
      menu
      option = gets.chomp.to_i
      operation = actions[option]
      if operation == :exit
        break
      elsif operation
        send(operation)
      else
        puts 'That is not a valid input'
      end
    end
  end

  def quit_app
    print 'thank you for using this app!'
    exit
  end

  def people_all
    if @people.empty?
      puts 'No people found'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def booksall
    @books.each { |object| puts "Title: '#{object.title}', Author: #{object.author}" }
  end

  def new_person
    puts 'Do you want to create a student (1) or a teacher (2) :'
    option_person = gets.chomp.to_i
    case option_person
    when 1
      newstudent
    when 2
      newteacher
    else
      print "select 1 or 2, you pick up wrong \n please do it again"
    end
  end

  def new_book
    puts 'Title: '
    book_title = gets.chomp.to_s
    puts 'Author: '
    book_author = gets.chomp.to_s
    list = Book.new(book_title, book_author)
    @books.push(list)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rental.push(Rentals.new(date, @books[book_index], @people[person_index]))
    @rentals << rental unless @rentals.include?(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    Rentals.all.each do |rental|
      puts "Date: #{rental.date}"
      puts "Book: #{rental.book.title} by #{rental.book.author}"
      puts "Person: #{rental.person.name}"
    end
  end

  def newstudent
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp.to_s
    puts 'Has parent permission?[Y/N]:'
    permission = gets.chomp.downcase

    case permission
    when 'n'
      parent_permission = false
    when 'y'
      parent_permission = true
    else
      puts 'Invalid input. Please enter Y or N.'
    end
    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts "Student created successfully!\n"
  end

  def newteacher
    puts 'Age: '
    age = gets.to_i
    puts 'name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp.to_s
    parent_permission = true
    teacher = Teacher.new(age, name, specialization, parent_permission)
    @people.push(teacher)
    puts "Teacher created successfully!\n"
  end
end
