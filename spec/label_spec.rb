require_relative '../lib/label'

describe 'Label' do
    before(:each) do
        label_one = Label.new('Gone with the wind', 'yellow')
    end

    context 'initializing' do
        it 'should be instance of Label' do
            expect(label_one).to be_instance_of Label
        end
    end
end