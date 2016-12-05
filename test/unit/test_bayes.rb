require_relative 'helper'

class FooVariant
  def initialize(successes, failures)
    @successes = successes
    @failures = failures
  end

  def successes
    @successes
  end

  def failures
    @failures
  end
end

class TestBayes < MiniTest::Test

  def test_binary_outcome_test
    test = ABBA::Bayes::BinaryOutcomeTest.new(FooVariant.new(1,1), FooVariant.new(1,1))

    assert_within_default_precision test.call, 0.5
  end
end
