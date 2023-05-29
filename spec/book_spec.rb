require_relative '../lib/book'

describe 'Book' do
    book = Book.new('Sagawa','good')
    context 'initializing' do
        it 'should be instance of Book' do
            expect(book).to be_instance_of Book
        end
    end

    context 'can_be_archived?' do
        it 'should return true if parent method return true or if cover_state equals to "bad"' do
            expect(book.can_be_archived?).to be_truthy
        end 
    end
end