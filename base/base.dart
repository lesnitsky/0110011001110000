var identity = (x) => x;
var constant = (x) => (_) => x;
var apply = (f) => (x) => f(x);
var compose = (f) => (g) => (x) => f(g(x));
var flip = (f) => (x) => (y) => f(y)(x);
