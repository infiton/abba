# ABBA(yesian Testing) - A/B Testing with Bayesian inference

## Quick Start

```
gem install abba
```

Basic usage:

```
require 'abba'

ab_test = ABBA::ABTest.new(
  variant_a: {successes: 10, failures: 10},
  variant_b: {successes: 10, failures: 10}
)

# get the probability that A is the best variant
ab_test.choose_a? # => 0.5

# get the probability that B is the best variant
ab_test.choose_b? # => 0.5

# get both probabilities [prob_a, prob_b] that A or B is the best variant
ab_test.probabilities # => [0.5, 0.5]
```
