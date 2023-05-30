require_relative '../lib/music_album'

describe MusicAlbum do
  album_one = MusicAlbum.new(true, '2000-1-13')
  album_two = MusicAlbum.new(false, '2000-1-13')

  context '#new' do
    it 'should be an instance of MusicAlbum' do
      expect(album_one).to be_instance_of MusicAlbum
    end
  end

  context '#can_be_archived?' do
    it "should return true if parent's method returns true AND if on_spotify equals true" do
      expect(album_one.instance_eval('can_be_archived?', __FILE__, __LINE__)).to be_truthy
    end

    it 'should return false' do
      expect(album_two.instance_eval('can_be_archived?', __FILE__, __LINE__)).to be_falsy
    end
  end
end
