require "minitest/autorun"
require_relative "../room"
require_relative "../song"
require_relative "../guest"


class TestRoom < Minitest::Test

  def setup
    @room = Room.new(1,3)
    @song = Song.new("Toxic","Brittney Spears")
    @guest = Guest.new("Pawel",100)
  end

  def test_has_room_number
    assert_equal(1,@room.name)
  end

  def test_can_be_occupied
    assert_equal([],@room.occupants)
  end

  def test_has_a_playlist
    assert_equal([],@room.playlist)
  end

  def test_has_max_capacity
    assert_equal(3,@room.max_capacity)
  end

  def test_has_total_sum
    assert_equal(0,@room.sum)
  end

  def test_add_song
    @room.add_song(@song)
    assert_equal(1,@room.playlist.length)
  end

  def test_take_payment
    @room.take_payment(@guest,10)
    assert_equal(10,@room.sum)
    assert_equal(90,@guest.money)
  end

  def test_check_in_guest
    @room.check_in_guest(@guest)
    assert_equal(1,@room.occupants)
  end

  def test_check_out_guest
    @room.check_in_guest(@guest)
    @room.check_out_guest("Pawel")
    assert_equal(0,@room.occupants)
  end

  def test_is_there_capacity?
    assert_equal(true,@room.is_there_capacity?)
  end



end
