require "minitest/autorun"
require_relative "../bar_tab"


class TestBarTab < Minitest::Test

  def setup
    @bar = BarTab.new()
    @order = {
      item:"Beer",
      price:3
    }
  end

  def test_has_a_total
    assert_equal(0,@bar.total)
  end

  def test_has_a_content
    assert_equal([],@bar.content)
  end

  def test_add_order
    @bar.add_order(@order)
    assert_equal(1,@bar.content.length)
  end

  def test_add_order_5_times
    5.times{|x| @bar.add_order(@order)}
    assert_equal(5,@bar.content.length)
  end

  def test_update_total
    @bar.add_order(@order)
    @bar.update_total
    assert_equal(3,@bar.total)
  end

end
