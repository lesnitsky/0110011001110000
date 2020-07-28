import 'church_encoding.dart';
import 'church_bool.dart';
import 'int_to_church_number.dart';

var isZero = (n) => n(and(False))(True);

void main() {
  for (int i = 0; i < 10; i++) {
    assert(cond(isZero(i.toChurchNumber()))(one)(two) == (i == 0 ? one : two));
  }
}
