require "minitest/autorun"
require_relative "../song"


class TestSong < Minitest::Test

  def setup
    @song = Song.new("Toxic","Brittney Spears")
  end

  def test_had_title
    assert_equal("Toxic",@song.title)
  end

  def test_has_artist
    assert_equal("Brittney Spears",@song.artist)
  end

end
