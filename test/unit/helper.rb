require 'minitest/autorun'

require_relative '../../lib/abba'

class MiniTest::Test
  DEFAULT_PRECISION = 0.001

  def assert_within_default_precision(actual, expected)
    assert_in_delta actual, expected, DEFAULT_PRECISION
  end
end
