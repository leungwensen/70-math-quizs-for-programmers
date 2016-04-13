var memo = new Array()
function fib(n){
  if (memo[n] == null){
    if ((n == 0) || (n == 1)){
      memo[n] = 1;
    } else {
      memo[n] = fib(n - 2) + fib(n - 1);
    }
  }
  return memo[n];
}
