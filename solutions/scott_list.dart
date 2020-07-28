var Nil = (n) => (c) => n;
var cons = (h) => (t) => (n) => (c) => c(h)(t);
var uncons = (t) => (n) => (c) => t(n)(c);

var _length = (l) => uncons(l)(0)((h) => (t) => 1 + _length(t));

extension List on Function {
  prepend(dynamic value) {
    return cons(value)(this);
  }

  int get length => _length(this);
}

void main() {
  var list = Nil;
  assert(list.length == 0);

  list = list.prepend(42);
  assert(list.length == 1);

  list = list.prepend(15);
  assert(list.length == 2);
}
