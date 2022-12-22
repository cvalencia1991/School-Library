require './book'
require './rental'
require './person'
require './student'
require './teacher'

class App
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

  # def option_menu(option)
  #   case option
  #   when 1
  #     books_all
  #   when 2
  #     people_all
  #   when 3
  #     new_person
  #   when 4
  #     new_book
  #   when 5
  #     create_rental
  #   when 6
  #     list_rentals
  #   when 7
  #     exit
  #   else
  #     puts "Invalid option: #{option}"
  #   end
  # end

  def option_menu(option)
    actions = {
      1 => :books_all,
      2 => :people_all,
      3 => :new_person,
      4 => :new_book,
      5 => :create_rental,
      6 => :list_rentals,
      7 => :exit
    }
    action = actions[option]
    if action.nil?
      puts "Invalid option: #{option}"
      menu
    else
      public_send(action)
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
    end
  end

  def new_book
    puts 'Tittle of the book: '
    title = gets.chomp
    puts 'Author of the book: '
    author = gets.chomp
    Book.new(title, author)
    print "Book Created Succesfully!\n"
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
    age = gets.chomp
    age = age.to_i
    puts 'Name: '
    name = gets.chomp
    puts 'Has parent permission?[Y/N]:'
    permission = gets.chomp.downcase
    case permission
    when 'n'
      parent_permission = false
    when 'y'
      parent_permission = true
    else
      puts 'Invalid input. Please enter Y or N.'
      return
    end
    Person.new(age, name, parent_permission)
    puts "Student created successfully!\n"
    menu
  end
end

def newteacher
  puts 'Age: '
  age = gets.chomp.to_i
  puts 'name: '
  name = gets.chomp
  if age.between?(0, 100)
    puts 'Speacialization: '

    specialization = gets.chomp.to_s
    Teacher.new(age, name, specialization)
    print "Teacher Creater Succesfully!\n"
    menu
  else
    puts "Invalid age. Please enter an age between 0 and 100.\n"
  end
end
