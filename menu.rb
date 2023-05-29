class Menu
  def prmopt_menu
    puts "\n Choose options
        1. List books
        2. List albums
        3. List games
        4. exit"
    gets.chomp.to_i
  end

  def choose_menu(num)
    case num
    when 1
      puts '1 - one'
    when 2
      puts '2 - two'
    when 3
      puts '3 - three'
    else
      puts 'type the valid option'
    end
  end

  def start_up
    puts "Welcome to my catalog \n"
    loop do
      num = prmopt_menu
      return if num == 4

      choose_menu(num)
    end
  end
end
