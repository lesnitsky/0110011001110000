import 'church_encoding.dart';

var t = (x) => (y) => x;
var f = (x) => (y) => y;

var cond = (b) => (ifTrue) => (ifFalse) => b(ifTrue)(ifFalse);
var and = (a) => (b) => a(b)(a);
var or = (a) => (b) => a(a)(b);
var not = (a) => (x) => (y) => a(y)(x);

void main() {
  assert(cond(t)(one)(two) == one);
  assert(cond(f)(one)(two) == two);

  assert(and(t)(t) == t);
  assert(and(t)(f) == f);
  assert(and(f)(t) == f);
  assert(and(f)(f) == f);

  assert(or(t)(t) == t);
  assert(or(t)(f) == t);
  assert(or(f)(t) == t);
  assert(or(f)(f) == f);

  assert(cond(not(t))(one)(two) == two);
  assert(cond(not(f))(one)(two) == one);
}
