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

  def test_how_much_money?
    assert_equal(100,@guest.how_much_money?)
  end

  def test_remove_money
    @guest.remove_money(20)
    assert_equal(80,@guest.how_much_money?)
  end


end
