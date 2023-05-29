require_relative '../lib/item'

describe "Item" do
    item = Item.new(2, '2022-12-04', true)
    context "initialization" do
        it "should be instance of Item" do
            expect(item).to be_instance_of Item
        end
    end
end