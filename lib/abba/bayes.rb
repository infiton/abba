module ABBA
  module Bayes
    class BinaryOutcomeTest
      def initialize(variant_a, variant_b)
        @variant_a = variant_a
        @variant_b = variant_b
      end

      def call
        total = 0.0

        (0..(alpha_a-1)).each do |i|
          log_contribution = Math.lbeta(alpha_b+i, beta_a+beta_b) - Math.log(beta_a+i) - Math.lbeta(1+i, beta_a) - Math.lbeta(alpha_b, beta_b)
          total += Math.exp(log_contribution)
        end

        total
      end

      private
      def alpha_a
        @variant_a.successes + 1
      end

      def beta_a
        @variant_a.failures + 1
      end

      def alpha_b
        @variant_b.successes + 1
      end

      def beta_b
        @variant_b.failures + 1
      end
    end
  end
end