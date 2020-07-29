import '../base/base.dart';

// Leaf(42) == Node(42)(Empty)(Empty)

var _ = identity;

var Empty = (c) => (_) => (_) => c;
var Leaf = (v) => (_) => (c) => (_) => c(v);
var Node = (v) => (l) => (r) => (_) => (_) => (c) => c(Leaf(v))(l)(r);

var _left = (_) => (l) => (_) => l;
var _right = (_) => (_) => (r) => r;

var $ = (node) => node(_)(_);

var leaf = (f) => (l) => (_) => (_) => f(l);
var children = (f) => (g) => (_) => (l) => (r) => f(g(l))(g(r));
var value = (node) => $(node)(leaf(value));
var left = (node) => $(node)(_left);
var right = (node) => $(node)(_right);

// var lengthT = (node) =>
//     node(0)((_) => 1)((_) => (l) => (r) => 1 + lengthT(l) + lengthT(r));

var lengthT =
    (node) => node(0)(constant(1))(children((l) => (r) => 1 + l + r)(lengthT));

void main() {
  var l = Node(42)(Leaf(34))(Empty);
  var n = Node(15)(l)(Empty);

  assert(value(l) == 42);
  assert(value(left(n)) == 42);
  assert(right(n) == Empty);

  print(lengthT(n));
}
