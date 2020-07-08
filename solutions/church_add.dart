// add(one)(two) should equal three

import 'church_encoding.dart';
import 'int_to_church_number.dart';

var add = (a) => (b) => (f) => (x) => a(f)(b(f)(x));

void main() {
  final r = add(13.toChurchNumber())(29.toChurchNumber()).toNumber();
  assert(r == 42);
}
