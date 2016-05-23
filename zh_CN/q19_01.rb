require 'prime'

primes = Prime.take(6)        # 用6个质数充当a~f
min = primes[-1] * primes[-1] # 把最小数字设置成最大质数的平方
min_friend = []

primes.permutation{|prime|    # 按顺序排列的6个质数
  # 按顺序选取2个数字做乘法
  friends = prime.each_cons(2).map{|x, y| x * y}
  # 开头和结尾的数字乘方
  friends += [prime[0], prime[-1]].map{|x| x * x}
  if min > friends.max then   # 更新最小数字的情况
    min = friends.max
    min_friend = friends
  end
}

puts min
p min_friend
