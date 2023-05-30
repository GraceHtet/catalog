require_relative '../lib/label'
require_relative '../lib/item'

describe 'Label' do
    before(:each) do
        @label_one = Label.new('Gone with the wind', 'yellow')
        @item_one = Item.new('2020-12-10', false)
    end

    context 'initializing' do
        it 'should be instance of Label' do
            expect(@label_one).to be_instance_of Label
        end
    end

    context 'with Label methods' do
        @label_one.add_item(@item_one)

        it 'should add the input item to the collection of items' do
            expect(@label_one.items).to include @item_one
        end

        it 'should have the same label in item class' do
           explect(@item_one.label).to be @label_one
        end 
    end
end