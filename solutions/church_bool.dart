import 'church_encoding.dart';

var True = (x) => (y) => x;
var False = (x) => (y) => y;

var cond = (b) => (ifTrue) => (ifFalse) => b(ifTrue)(ifFalse);
var and = (a) => (b) => a(b)(a);
var or = (a) => (b) => a(a)(b);
var not = (a) => (x) => (y) => a(y)(x);

void main() {
  assert(cond(True)(one)(two) == one);
  assert(cond(False)(one)(two) == two);

  assert(and(True)(True) == True);
  assert(and(True)(False) == False);
  assert(and(False)(True) == False);
  assert(and(False)(False) == False);

  assert(or(True)(True) == True);
  assert(or(True)(False) == True);
  assert(or(False)(True) == True);
  assert(or(False)(False) == False);

  assert(cond(not(True))(one)(two) == two);
  assert(cond(not(False))(one)(two) == one);
}
