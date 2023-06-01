require_relative '../lib/item'
require_relative '../lib/genre'
require_relative '../lib/author'
require_relative '../lib/label'

describe 'Item' do
  before(:each) do
    @item = Item.new('2002-12-04')
  end

  context 'initialization' do
    it 'should be instance of Item' do
      expect(@item).to be_instance_of Item
    end

    it 'should return true if published_date is older than 10 years' do
      expect(@item.instance_eval('can_be_archived?', __FILE__, __LINE__)).to be_truthy
    end

    it 'should change the archived property to true if move_to_archive method have been called' do
      @item.move_to_archive
      expect(@item.instance_eval { @archived }).to be_truthy
    end
  end

  context '#genre' do
    before(:each) do
      genre = Genre.new('Fiction')
      @item.genre = genre
    end

    it 'should create instance genre for the item' do
      expect(@item.genre).to be_instance_of Genre
    end

    it 'the genre instance should have name set' do
      name = @item.genre.name
      expect(name).to eq 'Fiction'
    end
  end

  context '#author' do
    before(:each) do
      author = Author.new('Dare', 'Ade')
      @item.author = author
    end

    it 'should create instance author for the item' do
      expect(@item.author).to be_instance_of Author
    end

    it 'the genre instance should have name set' do
      first_name = @item.author.first_name
      last_name = @item.author.last_name

      expect(first_name).to eq 'Dare'
      expect(last_name).to eq 'Ade'
    end
  end

  context '#label' do
    before(:each) do
      label = Label.new('Learn Ruby', 'Green')
      @item.label = label
    end

    it 'should create instance label for the item' do
      expect(@item.label).to be_instance_of Label
    end

    it 'the genre instance should have name set' do
      title = @item.label.title
      color = @item.label.color

      expect(title).to eq 'Learn Ruby'
      expect(color).to eq 'Green'
    end
  end
end
