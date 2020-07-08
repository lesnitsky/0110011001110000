// f(0) == zero
// f(1) == one

import 'church_encoding.dart';

extension ChurchConversion on int {
  Function toChurchNumber() =>
      this == 0 ? zero : succ((this - 1).toChurchNumber());
}

void main() {
  var fourtyTwo = 42.toChurchNumber();
  assert(fourtyTwo.toNumber() == 42);
}
