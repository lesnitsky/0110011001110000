import '../base/base.dart';

var Nothing = (b) => (c) => b;
var Just = (a) => (b) => (c) => c(a);

var match = identity;

void main() {
  var n = Nothing;
  var j = Just(42);

  assert(match(n)(0)(1) == 0);
  assert(match(j)(0)((a) => a * 2) == 84);
}
