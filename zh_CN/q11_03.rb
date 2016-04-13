@memo = {}
def fib(n)
  return @memo[n] if @memo.has_key?(n)
  if (n == 0) || (n == 1) then
    @memo[n] = 1
  else
    @memo[n] = fib(n - 1) + fib(n - 2)
  end
end
