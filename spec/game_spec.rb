require_relative './spec_helper'
describe Game do
    before(:each) do
        @game = Game.new('player1', '2020-12-04')
    end

    describe '#initialize' do
        it 'should create an instance with attributes, multiplayer and last_played_at,' do
            expect(@game).to be_instance_of Game
        end
    end

    describe '#can_be_archived' do
        it 'should return true if parent method returns true and last_played_at is older than 2 years' do
            @game.publish_date = '2012-01-03'
            expect(@game.can_be_archived?).to be_truthy
        end
        it 'should return false if parent method returns true otherwise' do
            @game.publish_date = '2022-01-03'
            expect(@game.can_be_archived?).to be_falsey
        end
    end
end