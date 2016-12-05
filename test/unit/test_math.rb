require_relative 'helper'

class TestMath < MiniTest::Test

  def test_lbeta
    assert_within_default_precision ABBA::Math.lbeta(1,1), 0.0
  end
end
