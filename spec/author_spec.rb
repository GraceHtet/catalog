require_relative '../lib/author'

describe Author do
  before(:each) do
    @author = Author.new('James', 'Zerihun')
  end
  describe '#initialize' do
    it 'should create an instance with attributes, ' do
      expect(@author).to be_instance_of Author
    end
  end
  describe '#add_item' do
    it 'should change items length to 1 when we add one item' do
      item = Item.new('2002-12-04')
      @author.add_item(item)
      expect(@author.instance_eval { @items }.length).to be 1
    end
  end
end
