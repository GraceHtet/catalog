require_relative '../music_album'

describe MusicAlbum do
    album_one = MusicAlbum.new(true, 'Dare', false, '2000-1-13')
    album_two = MusicAlbum.new(false, 'Dare', false, '2000-1-13')
    
    context "#new" do
        it "should be an instance of MusicAlbum" do
            expect(album_one).to be_instance_of MusicAlbum
        end
    end

    context "#can_be_archived?" do
        it "should return true if parent's method returns true AND if on_spotify equals true" do
            expect(album_one.can_be_archived?).to be_truthy
        end

        it "should return false" do
            expect(album_two.can_be_archived?).to be_falsy
        end
        
    end

end
