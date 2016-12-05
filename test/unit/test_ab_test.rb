require_relative 'helper'

class TestABTest < MiniTest::Test
  def test_choose_a
    mock_test_class = MiniTest::Mock.new
    mock_test_obj = MiniTest::Mock.new

    mock_test_class.expect(:new, mock_test_obj,[
      ABBA::ABTest::Variant.new(successes: 10, size: 20),
      ABBA::ABTest::Variant.new(successes: 10, size: 20)
    ])
    mock_test_obj.expect(:call, 0.5)

    ab_test = ABBA::ABTest.new(
      variant_a: {successes: 10, size: 20},
      variant_b: {successes: 10, size: 20},
      test: mock_test_class
    )

    assert_within_default_precision ab_test.choose_a?, 0.5
  end

  def test_choose_a
    mock_test_class = MiniTest::Mock.new
    mock_test_obj = MiniTest::Mock.new

    mock_test_class.expect(:new, mock_test_obj,[
      ABBA::ABTest::Variant.new(successes: 10, size: 20),
      ABBA::ABTest::Variant.new(successes: 10, size: 20)
    ])
    mock_test_obj.expect(:call, 0.5)

    ab_test = ABBA::ABTest.new(
      variant_a: {successes: 10, size: 20},
      variant_b: {successes: 10, size: 20},
      test: mock_test_class
    )

    assert_within_default_precision ab_test.choose_b?, 0.5
  end

  def test_probabilities
    mock_test_class = MiniTest::Mock.new
    mock_test_obj = MiniTest::Mock.new

    mock_test_class.expect(:new, mock_test_obj,[
      ABBA::ABTest::Variant.new(successes: 10, size: 20),
      ABBA::ABTest::Variant.new(successes: 10, size: 20)
    ])
    mock_test_obj.expect(:call, 0.5)

    ab_test = ABBA::ABTest.new(
      variant_a: {successes: 10, size: 20},
      variant_b: {successes: 10, size: 20},
      test: mock_test_class
    )

    probs = ab_test.probabilities

    assert_within_default_precision probs[0], 0.5
    assert_within_default_precision probs[1], 0.5
  end
end

class TestABTestVariant < MiniTest::Test

  def test_initialize_with_successes_and_failures
    variant = ABBA::ABTest::Variant.new(successes: 10, failures: 10)

    assert_equal variant.successes, 10
    assert_equal variant.failures, 10
    assert_equal variant.size, 20
  end

  def test_initialize_with_successes_and_size
    variant = ABBA::ABTest::Variant.new(successes: 10, size: 20)

    assert_equal variant.successes, 10
    assert_equal variant.failures, 10
    assert_equal variant.size, 20
  end

  def test_initialize_with_failures_and_size
    variant = ABBA::ABTest::Variant.new(failures: 10, size: 20)

    assert_equal variant.successes, 10
    assert_equal variant.failures, 10
    assert_equal variant.size, 20
  end

  def test_initialize_with_consistent_successes_and_failures_and_size
    variant = ABBA::ABTest::Variant.new(successes: 10, failures: 10, size: 20)

    assert_equal variant.successes, 10
    assert_equal variant.failures, 10
    assert_equal variant.size, 20
  end

  def test_initialize_with_inconsistent_successes_and_failures_and_size
    assert_raises(ArgumentError) do
      ABBA::ABTest::Variant.new(successes: 10, failures: 10, size: 10)
    end
  end

  def test_initialize_with_only_size
    assert_raises(ArgumentError) do
      ABBA::ABTest::Variant.new(size: 10)
    end
  end

  def test_initialize_with_only_successes
    assert_raises(ArgumentError) do
      ABBA::ABTest::Variant.new(successes: 10)
    end
  end

  def test_initialize_with_only_failures
    assert_raises(ArgumentError) do
      ABBA::ABTest::Variant.new(failures: 10)
    end
  end

  def test_success_rate
    variant = ABBA::ABTest::Variant.new(successes: 10, failures: 20)

    assert_within_default_precision variant.success_rate, 0.333333
  end

  def test_failure_rate
    variant = ABBA::ABTest::Variant.new(successes: 10, failures: 20)

    assert_within_default_precision variant.failure_rate, 0.666666
  end

  def test_eql
    assert ABBA::ABTest::Variant.new(successes: 10, failures: 20) == ABBA::ABTest::Variant.new(successes: 10, failures: 20)
    refute ABBA::ABTest::Variant.new(successes: 10, failures: 20) == ABBA::ABTest::Variant.new(successes: 10, failures: 10)
  end

end
