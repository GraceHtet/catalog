require_relative '../lib/label'
require_relative '../lib/item'

describe 'Label' do
  before(:each) do
    @label_one = Label.new('Gift', 'yellow')
    @item_one = Item.new('2020-12-10')

    @label_one.add_item(@item_one)
    @label_one.add_item(@item_one)
  end

  context 'initializing' do
    it 'should be instance of Label' do
      expect(@label_one).to be_instance_of Label
    end
  end

  context 'with Label methods' do
    it 'should add the input item to the collection of items' do
      expect(@label_one.instance_eval { @items }).to include @item_one
    end

    it 'should have the same label in item class' do
      expect(@item_one.label).to be @label_one
    end

    it 'length should be one if the same item was added' do
      expect(@label_one.instance_eval { @items }.length).to eq 1
    end
  end
end
