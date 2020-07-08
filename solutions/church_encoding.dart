// f f x = x
// one f x = f x
// two f x = ... one ... ??? WTF

// inc n = ... (n + 1) ... WTF?!?!

extension ChNumber on Function {
  int toNumber() => this(inc)(0);
}

var zero = (f) => (x) => x;
var one = (f) => (x) => f(zero(f)(x));
var two = (f) => (x) => f(one(f)(x));
var succ = (n) => (f) => (x) => f(n(f)(x));

var inc = (x) => ++x;

void main() {
  var three = succ(two);

  print(two.toNumber());
  print(three.toNumber());
}
