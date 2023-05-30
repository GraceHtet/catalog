require_relative './lib/book'
require_relative './lib/game'
require_relative './module/storage'

class App
  include Storage

  def initialize
    @books = []
    @albums = []
    @games = []
  end

  def list_books; end

  def list_albums
    puts 'List all music albums'
  end

  def list_games
    puts 'List of games'
    @games.each do |game|
      puts "[Published Date]: #{game.publish_date} [Multiplayer]: #{game.multiplayer} [Last played at]: #{game.last_played_at}"
    end
  end

  def list_geners
    puts 'List all genres'
  end

  def list_labels
    puts 'List all labels'
  end

  def list_authors
    puts 'List all authors'
  end

  def add_book; end

  def add_album
    puts 'Add a music album'
  end

  def add_game
    puts 'Add a game'
    game_publish_date = prompt_data('Published date: ')
    multiplayer = prompt_data('Multiplayer: ')
    last_played = prompt_data('Last played at: ')
    game = Game.new(game_publish_date,multiplayer,last_played)
    @games << game
    puts 'Game sucessfully added!'
  end

  def exit
    puts 'Thanks for using our app'
  end

  private

  def prompt_data(text)
    puts text
    gets.chomp
  end
end
