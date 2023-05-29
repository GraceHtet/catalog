describe Game do
    before(:each) do
        @game = Game.new('player1', Date.new(2023, 5, 22))
    end
    describe '#initialize' do
        it 'should create an instance with attributes, multiplayer and last_played_at,' do
            expect(@game).to be_instance_of Game
        end
    end
end