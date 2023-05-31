require_relative './lib/book'
require_relative './lib/game'
require_relative './module/storage'

require_relative './lib/label'
require_relative './lib/author'

class App
  include Storage

  def initialize
    @books = fetch_books || []
    @albums = []
    @games = fetch_games || []
    @genres = []
    @authors = fetch_author || []
    @labels = fetch_labels || []
  end

  def list_books
    return puts 'There is no book in the list yet!' if @books.empty?

    @books.each do |book|
      puts "Published at: #{book.publish_date} by #{book.publisher.capitalize}, Cover State: #{book.cover_state}"
    end
  end

  def list_albums
    puts 'List all music albums'
  end

  def list_games
    puts 'List of games'
    @games.each do |game|
      published_date = game.publish_date
      multiplayer = game.multiplayer
      last_played_at = game.last_played_at
      puts "Published at: #{published_date}, Multiplayer: #{multiplayer}, Last played at: #{last_played_at}"
    end
  end

  def list_geners
    puts 'List all genres'
  end

  def list_labels
    return puts 'There is no label in the list yet!' if @labels.empty?

    puts 'The labels in the list:'
    @labels.each_with_index do |label, idx|
      puts "#{idx}) #{label.title}"
    end
  end

  def list_authors
    return puts 'There is no author in the list yet!' if @authors.empty?

    puts 'The authors in the list:'
    @authors.each_with_index do |author, idx|
      puts "#{idx}) #{author.first_name} #{author.last_name}"
    end
  end

  def add_book
    publisher = prompt_data('Publisher Name: ')
    cover_state = prompt_data('Choose cover state(good/normal/bad): ')
    publish_date = prompt_data('Published Date(YYYY/MM/DD): ')

    book = Book.new(publisher, cover_state, publish_date)
    add_extra_details(book)
    @books << book
    puts 'A book created successfully :)'
  end

  def add_album
    puts 'Add a music album'
  end

  def add_game
    puts 'Add a game'
    game_publish_date = prompt_data('Published date: ')
    multiplayer = prompt_data('Multiplayer: ')
    last_played = prompt_data('Last played at: ')
    game = Game.new(game_publish_date, multiplayer, last_played)
    add_extra_details(game)
    @games << game
    puts 'A game created successfully :)'
  end

  def exit
    save_books(@books)
    save_games(@games)
    save_extra_details(@labels, @genres, @authors)
    puts 'Thanks for using our app'
  end

  private

  def prompt_data(text)
    puts text
    gets.chomp
  end

  def add_extra_details(klass)
    first_name = prompt_data("Add Author's First Name: ")
    last_name = prompt_data("Add Author's Last Name: ")
    title = prompt_data('Add Title: ')
    color = prompt_data('Choose Color: ')

    label = Label.new(title, color)
    author = Author.new(first_name, last_name)

    store_extra_details(label, @labels)
    store_extra_details(author, @authors)

    klass.send(:label=, label)
    klass.send(:author=, author)
  end

  def store_extra_details(klass, array)
    array << klass
  end
end
