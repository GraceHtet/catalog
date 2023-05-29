require_relative '../lib/book'

describe 'Book' do
    book_one = Book.new('Sagawa','bad', '2022-11-02')
    book_two = Book.new('Sakura', 'good', '2002-12-04')
    book_three = Book.new('Milton', 'good', '2013-11-03')
    context 'initializing' do
        it 'should be instance of Book' do
            expect(book_one).to be_instance_of Book
            expect(book_two).to be_instance_of Book
        end
    end

    context 'can_be_archived?' do
        it 'should return true if parent method return true' do
            expect(book_one.can_be_archived?).to be_truthy
            expect(book_two.can_be_archived?).to be_truthy
        end
        
        it 'should return false' do
            expect(book_three.can_be_archived?).to be_falsy
        end
    end
end