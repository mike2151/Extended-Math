namespace ExtendedMath\Statistics;

use namespace HH\Lib\{C, Math};
use namespace HH;

// computes the standard deviation of a vec
// adapted from: https://www.php.net/manual/en/function.stats-standard-deviation.php
function std(vec<num> $v, bool $is_sample) : float {
    $count = C\count($v);
    invariant($count !== 0, "The input has 0 elements");    
    invariant($count !== 1, "The input has 1 element"); 
    $mean = Math\mean($v);
    $carry = 0.0;
    foreach ($v as $val) {
        $d = ((float) $val) - $mean;
        $carry += $d * $d;
    };
    if ($is_sample) {
       --$count;
    }
    return Math\sqrt($carry / $count);
}
