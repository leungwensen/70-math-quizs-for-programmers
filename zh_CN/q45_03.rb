def count_swap(n)
  return 0 if n == 1
  (n - 1) * (1..(n-1)).inject(1, :*) + n * count_swap(n - 1)
end
puts count_swap(7)
