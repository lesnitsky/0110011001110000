import '../base/base.dart';
import 'church_bool.dart';

var cond = identity;

void main() {
  assert(cond(True)(1)(2) == 1);
  assert(cond(False)(1)(2) == 2);
}
