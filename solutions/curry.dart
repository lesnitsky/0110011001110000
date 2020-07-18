// f = (a) => (b) => ...
// uncurry f == (Tuple(a, b)) => ...
// curry (Tuple(a, b)) => ... == (a) => (b) => ...

import 'tuple.dart';

var uncurry = (f) => (Function t) => f(t.fst)(t.snd);
var curry = (f) => (a) => (b) => f(Tuple(a)(b));

void main() {
  var f = (a) => (b) => a + b;

  var t = uncurry(f);
  var d = t(Tuple(1)(2));

  var g = curry(t);

  assert(d == 3);
  assert(g(1)(2) == 3);
}
