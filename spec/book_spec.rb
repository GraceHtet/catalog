require_relative '../lib/book'

describe 'Book' do
    book = Book.new('Sagawa','good')
    context 'initializing' do
        it 'should be instance of Book' do
            expect(book).to be_instance_of Book
        end
    end
end