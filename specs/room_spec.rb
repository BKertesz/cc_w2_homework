require "minitest/autorun"
require_relative "../room"
require_relative "../song"
require_relative "../guest"
require_relative "../bar_tab"


class TestRoom < Minitest::Test

  def setup
    @bar = BarTab.new()
    @room = Room.new(1,3,5,@bar)
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

  def test_bar_access
    result = @room.bar.total
    assert_equal(0,result)
  end

  def test_has_entry_fee
    assert_equal(5,@room.entry_fee)
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
    assert_equal(1,@room.occupants.length)
  end

  def test_check_out_guest
    @room.check_in_guest(@guest)
    @room.check_out_guest("Pawel")
    assert_equal(0,@room.occupants.length)
  end

  def test_is_there_capacity?
    assert_equal(true,@room.is_there_capacity?)
  end

  def test_anyone_has_favorite_on_playlist
    @guest.favorite_song = "Toxic"
    @room.add_song(@song)
    @room.check_in_guest(@guest)
    assert_equal(true,@room.playlist_favorites)
  end

  def test_can_guest_order
    @room.check_in_guest(@guest)
    new_order = @room.occupants[0].order("Coffee",3)
    @room.bar.add_order(new_order)
    @room.bar.update_total
    assert_equal(3,@room.bar.total)
  end

  def test_pay_off_bar_tab
    @room.pay_off_bar(@guest)
    assert_equal([],@room.bar.content)
    assert_equal(0,@room.bar.total)
  end


end
