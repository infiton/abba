module ABBA
  class ABTest
    def initialize(variant_a:, variant_b:, test: Bayes::BinaryOutcomeTest)
      @variant_a = ABTest::Variant.new(variant_a)
      @variant_b = ABTest::Variant.new(variant_b)
      @test = test
    end

    def choose_a?
      @test.new(@variant_a, @variant_b).call
    end

    def choose_b?
      @test.new(@variant_b, @variant_a).call
    end

    def probabilities
      p = choose_a?
      [p, 1-p]
    end

    class Variant
      def initialize(args={})
        @successes = args[:successes]
        @failures = args[:failures]
        @size = args[:size]
        raise ArgumentError, "Invalid ABTest variant, you must pass 2 or more of :successes, :failures, :size and successes + failures = size" unless validate
      end

      def successes
        @successes ||= calculate_successes
      end

      def failures
        @failures ||= calculate_failures
      end

      def size
        @size ||= calculate_size
      end

      def success_rate
        successes/size.to_f
      end

      def failure_rate
        failures/size.to_f
      end

      def ==(other)
        size == other.size && successes == other.successes && failures == other.failures
      end

      private
      def has_successes?
        !!successes
      end

      def has_failures?
        !!failures
      end

      def has_size?
        !!size
      end

      def calculate_successes
        @size - @failures if @size && @failures
      end

      def calculate_failures
        @size - @successes if @size && @successes
      end

      def calculate_size
        @successes + @failures if @successes && @failures
      end

      def validate
        has_successes? && has_failures? && has_size? && (successes + failures == size)
      end
    end
  end
end
