require 'json'
require_relative '../lib/book'

module Storage
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

  def array_to_hash(array)
    array.map(&:to_hash)
  end
end
