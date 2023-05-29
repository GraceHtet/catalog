require_relative '../lib/item'

describe "Item" do
    item = Item.new('2022-12-04', true)
    context "initialization" do
        it "should be instance of Item" do
            expect(item).to be_instance_of Item
        end

        it "should return true if published_date is older than 10 years" do
            expect(item.can_be_archived?).to be_truthy
        end
    end
end