require './app'
def main
  print "Welcome to School library app!\n"
  app = App.new
  app.menu
  option = gets.chomp.to_i
  app.option_menu(option)
end

main
