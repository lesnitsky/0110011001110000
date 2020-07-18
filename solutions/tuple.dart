// tuple a b f = f a b
// fst t == a
// snd t == b

import 'church_bool.dart';

var Tuple = (a) => (b) => (f) => f(a)(b);

extension TupleDotAccess on Function {
  get fst => this(True);
  get snd => this(False);
}

void main() {
  var t = Tuple(1)(2);

  assert(t.fst == 1);
  assert(t.snd == 2);
}
