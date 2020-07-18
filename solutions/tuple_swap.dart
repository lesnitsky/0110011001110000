// swap(Tuple(a, b)) == Tuple(b, a)

import 'tuple.dart';

var swap = (Function t) => Tuple(t.snd)(t.fst);

void main() {
  var result = swap(Tuple(1)(2));
  assert(result.fst == 2);
  assert(result.snd == 1);
}
