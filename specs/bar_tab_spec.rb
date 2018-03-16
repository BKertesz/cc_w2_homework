require "minitest/autorun"
require_relative "../bar_tab"


class TestBarTab < Minitest::Test

  def setup
    @bar = BarTab.new()
  end

end
