const recursive = (n)  => {
  if (n === 0) return 0;
  if (n === 1) return 1;

  return fib(n - 2) + fib(n -1);
}

const iterative = (n) => {
  let [a, b] = [1, 0];
  while (n-- > 0) {
    [a, b] = [b + a, a];
  }
  return b;
}

const fibSexy = (n, a = 1, b = 0) => (n === 0) ? b : fibSexy(n - 1, a + b, a);
