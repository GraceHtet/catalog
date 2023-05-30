require 'json'
require_relative '../lib/book'
require_relative '../lib/label'

module Storage
  def save_books(books)
    save_data('./data/book.json', array_to_hash(books))
  end

  def save_extra_details(label, _genre, author)
    save_data('./data/author.json', array_to_hash(author))
    save_data('./data/label.json', array_to_hash(label))
  end

  def fetch_books
    books = fetch_data('./data/book.json')
    book_arr = []
    books&.each do |book|
      book_sample = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
      extra_to_array(book_sample, book)
      book_arr << book_sample
    end
    book_arr
  end

  def fetch_labels
    labels = fetch_data('./data/label.json')
    labels&.map do |label|
      Label.new(label['title'], label['color'])
    end
  end

  private

  def save_data(file_path, data)
    json = JSON.generate(data)
    File.write(file_path, json)
  end

  def fetch_data(file_path)
    return nil if File.empty?(file_path)

    json_data = File.read(file_path)
    JSON.parse(json_data) unless json_data.empty?
  end

  def array_to_hash(arr)
    arr.map(&:to_hash)
  end

  def extra_to_array(klass, data)
    label = Label.new(data['label']['title'], data['label']['color'])
    author = Author.new(data['author']['first_name'], data['author']['last_name'])
    klass.send(:label=, label)
    klass.send(:author=, author)
  end
end