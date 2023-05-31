require_relative './lib/book'
require_relative './lib/game'
require_relative './module/storage'

require_relative './lib/label'
require_relative './lib/author'
require_relative './lib/music_album'


class App
  include Storage

  def initialize
    @books = fetch_books || []
    @albums = fetch_albums || []
    @games = fetch_games || []
    @genres = fetch_genres || []
    @authors = fetch_authors || []
    @labels = fetch_labels || []
  end

  def list_books
    return puts 'There is no book in the list yet!' if @books.empty?

    @books.each do |book|
      puts "Published at: #{book.publish_date} by #{book.publisher.capitalize}, Cover State: #{book.cover_state}"
    end
  end

  def list_albums
    return puts 'There is no album created yet!' if @albums.empty?

    puts 'List of all Albums in the collection:'
    @albums.each do |album|
      on_spotify = album.on_spotify == 'y' ? 'Yes' : 'No'
      puts "Label: #{album.label.title}, Date Published: #{album.publish_date}, On spotify: #{on_spotify}"
    end
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

  def list_genres
    return puts 'No genre created yet!' if @genres.empty?

    puts 'List of all Genres in the collection'
    @genres.each_with_index do |genre, index|
      puts "#{index}) #{genre.name}"
    end
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
    publish_date = prompt_data('Published Date(YYYY/MM/DD): ')
    on_spotify = prompt_data('Available on spotify (Y or N)?: ').downcase

    on_spotify = prompt_data('Please input Y or N: ').downcase while on_spotify != 'y' && on_spotify != 'n'

    album = MusicAlbum.new(on_spotify, publish_date)
    add_extra_details(album)
    @albums << album

    puts 'Music album created sucessfully'
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
    save_albums(@albums)
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
    genre_name = prompt_data('What is its Genre name: ')

    label = Label.new(title, color)
    author = Author.new(first_name, last_name)
    genre = Genre.new(genre_name)

    store_extra_details(label, @labels)
    store_extra_details(author, @authors)
    store_extra_details(genre, @genres)

    klass.send(:label=, label)
    klass.send(:author=, author)
    klass.send(:genre=, genre)
  end

  def store_extra_details(klass, array)
    array << klass
  end
end
