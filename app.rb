require './book'
require './rental'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
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

  def option_menu(option)
    actions = {
      1 => :books_all,
      2 => :people_all,
      3 => :new_person,
      4 => :new_book,
      5 => :create_rental,
      6 => :list_rentals,
      7 => :quit_app
    }
    action = actions[option]
    if action.nil?
      puts "Invalid option: #{option}"
    else
      send(action)
    end
    main
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

  def books_all
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
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
      main
    end
  end

  def new_book
    puts 'Tittle of the book: '
    title = gets.chomp
    puts 'Author of the book: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    print "Book Created Succesfully!\n"
    main
  end

  def create_rental
    puts 'Select a book from the following list by number'
    print "#{books_all}\n"
    select_book = gets.chomp.to_i
    puts 'Select a person from the following list by number(not id)'
    print "#{people_all}\n"
    select_person = gets.chomp.to_i
    puts 'Date [yyyy-mm-dd]:'
    date = gets.chomp
    Rental.new(date, Person.all[select_person], Book.all[select_book])
    print 'Rental created succesfully'
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
    puts 'class:'
    classroom = gets.chomp.to_s
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
    student = Student.new(age, name, classroom, parent_permission)
    @people.push(student)
    puts "Student created successfully!\n"
    main
  end

  def newteacher
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp.to_s
    teacher = Teacher.new(age, name, specialization, parent_permission: true)
    @people.push(teacher)
    puts "Teacher created successfully!\n"
    main
  end
end
