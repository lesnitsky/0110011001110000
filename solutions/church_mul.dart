// mul(three)(four) should equal twelve

import 'church_encoding.dart';
import 'int_to_church_number.dart';

var mul = (a) => (b) => (f) => (x) => a(b(f))(x);

void main() {
  final a = 4;
  final b = 12;

  final r = mul(a.toChurchNumber())(b.toChurchNumber()).toNumber();

  assert(r == a * b);
}
