class Menu
  def initialize(app)
    @app = app
    @menus = {
      1 => { label: 'List all books', action: :list_books },
      2 => { label: 'List all music albums', action: :list_albums },
      3 => { label: 'List of games', action: :list_games },
      4 => { label: 'List all genres', action: :list_geners },
      5 => { label: 'List all labels', action: :list_labels },
      6 => { label: 'List all authors', action: :list_authors },
      7 => { label: 'Add a book', action: :add_book },
      8 => { label: 'Add a music album', action: :add_album },
      9 => { label: 'Add a game', action: :add_game },
      10 => { label: 'Exit', action: :exit }
    }
  end

  def prmopt_menu
    puts "\n"
    @menus.each do |key, value|
      puts "#{key}. #{value[:label]}"
    end
    gets.chomp.to_i
  end

  def choose_menu(num)
    menu_size = @menus.size
    if (1..menu_size).include?(num)
      chosen = @menus[num][:action]
      @app.send(chosen)
    else
      puts 'Type a valid number'
    end
  end

  def start_up
    puts "Welcome to my catalog \n"
    loop do
      num = prmopt_menu
      choose_menu(num)

      return if num == @menus.size
    end
  end
end
