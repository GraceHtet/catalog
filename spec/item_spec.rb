require_relative '../lib/item'
require_relative '../lib/label'

describe "Item" do
    before(:each) do 
        @item = Item.new('2002-12-04', false)
    end

    context "initialization" do
        it "should be instance of Item" do
            expect(@item).to be_instance_of Item
        end

        it "should return true if published_date is older than 10 years" do
            expect(@item.can_be_archived?).to be_truthy
        end

        it 'should change the archived property to true if move_to_archive method have been called' do
            @item.move_to_archive
            expect(@item.archived).to be_truthy
        end
    end
end