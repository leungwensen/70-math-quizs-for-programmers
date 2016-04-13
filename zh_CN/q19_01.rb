require 'prime'

primes = Prime.take(6)        # a〜fに当てはまる素数6個
min = primes[-1] * primes[-1] # 最大でも一番大きいものの平方
min_friend = []

primes.permutation{|prime|    # 6個の素数の順列
  # 2つずつ選んで掛け算する
  friends = prime.each_cons(2).map{|x, y| x * y}
  # 先頭と末尾は同じ数の平方
  friends += [prime[0], prime[-1]].map{|x| x * x}
  if min > friends.max then   # 最小を更新した場合
    min = friends.max
    min_friend = friends
  end
}

puts min
p min_friend
