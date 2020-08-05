import 'church_encoding.dart';

var Nil = (n) => (c) => n;
var cons = (h) => (t) => (n) => (c) => c(h)(t);
var uncons = (t) => (n) => (c) => t(n)(c);

var _length = (l) => uncons(l)(0)((h) => (t) => 1 + _length(t));
var _lengthC = (l) => uncons(l)(zero)((_) => (t) => succ(_lengthC(t)));

extension List on Function {
  prepend(dynamic value) {
    return cons(value)(this);
  }

  int get length => _length(this);
  int get lengthC => (_lengthC(this) as Function).toNumber();
}

void main() {
  var list = Nil;
  assert(list.length == 0);
  assert(list.lengthC == list.length);

  list = list.prepend(42);
  assert(list.length == 1);
  assert(list.lengthC == list.length);

  list = list.prepend(15);
  assert(list.length == 2);
  assert(list.lengthC == list.length);
}
