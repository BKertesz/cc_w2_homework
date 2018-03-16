require "minitest/autorun"
require_relative "../guest"

class TestGuest < Minitest::Test

  def setup
    @guest = Guest.new("Pawel",100)
  end

  def test_has_name
    assert_equal("Pawel",@guest.name)
  end

  def test_has_money
    assert_equal(100,@guest.money)
  end

  def test_has_enough_money?
    assert_equal(true,@guest.enough_money?(50))
  end

  def test_remove_money
    @guest.remove_money(20)
    assert_equal(80,@guest.money)
  end

  def test_has_favorite_song?
    assert_nil(@guest.favorite_song)
  end

  def test_set_up_favorite_song
    @guest.find_out_favorite_song("Toxic")
    assert_equal("Toxic",@guest.favorite_song)
  end

  def test_can_order
    test_hash = {
      item:"Beer",
      price:3
    }
    assert_equal(test_hash,@guest.order("Beer",3))
  end



end
