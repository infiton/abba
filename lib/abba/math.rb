require 'singleton'

module ABBA
  module Math

    class << self
      def exp(x)
        ::Math.exp(x)
      end

      def log(x)
        ::Math.log(x)
      end

      def gamma(x)
        ::Math.gamma(x)
      end

      def lgamma(x)
        ::Math.lgamma(x)
      end

      def beta(x,y)
        (gamma(x)*gamma(y))/(gamma(x+y))
      end

      def lbeta(x,y)
        lgamma_x, sign_gamma_x = lgamma(x)
        lgamma_y, sign_gamma_y = lgamma(y)
        lgamma_xy, sign_gamma_xy = lgamma(x+y)

        if (sign_gamma_x * sign_gamma_y * sign_gamma_xy) == 1
          lgamma_x + lgamma_y - lgamma_xy
        else
          raise ::Math::DomainError, 'Numerical argument is out of domain - "lbeta"'
        end
      end
    end
  end
end