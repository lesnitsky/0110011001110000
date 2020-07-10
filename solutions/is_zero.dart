import 'church_encoding.dart';
import 'church_bool.dart';

var isZero = (n) => (x) => (y) => n(not)(t)(x)(y);

void main() {
  assert(isZero(zero)(one)(two) == one);
  assert(isZero(one)(one)(two) == two);
}
