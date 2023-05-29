require_relative '../lib/author'

describe Author do
    before(:each) do
        @author = Author.new('James','Zerihun')
      end
    describe '#initialize' do
        it 'should create an instance with attributes, ' do
          expect(@author).to be_instance_of Author
        end
      end
end