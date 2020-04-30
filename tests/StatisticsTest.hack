namespace ExtendedMath\StatisticsTest;

require_once(__DIR__.'/../vendor/autoload.hack');
use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

use function ExtendedMath\Statistics\std_dev;

final class StatisticsTest extends HackTest {
  <<__Override>>
  public static async function beforeFirstTestAsync(): Awaitable<void> {
    \Facebook\AutoloadMap\initialize();
  }

  public function testStandardDeviationSimpleIntNoSample(): void {
    $numbers = vec[-5, 1, 8, 7, 2];
    $sd = std_dev($numbers);
    expect($sd)->toEqualWithDelta(4.6733, .0001);
  }
}
