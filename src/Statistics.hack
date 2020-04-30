namespace ExtendedMath\Statistics;

use function HH\Lib\C\count;
use function HH\Lib\Math\mean;
use function HH\Lib\Math\sqrt;
use function HH\invariant;

// computes the standard deviation of a vec
// adapted from: https://www.php.net/manual/en/function.stats-standard-deviation.php
function std_dev(vec<num> $v, bool $is_sample = false): float {
  $count = count($v);
  invariant($count !== 0, "The input has 0 elements");
  invariant($count !== 1, "The input has 1 element");
  $mean = (float)mean($v);
  $carry = 0.0;
  foreach ($v as $val) {
    $float_val = (float)$val;
    $d = $float_val - $mean;
    $carry += $d * $d;
  }
  ;
  if ($is_sample) {
    --$count;
  }
  return sqrt($carry / $count);
}
