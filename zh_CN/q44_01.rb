def search(abc, depth, max_abc, log)
  return false if log.has_key?(abc)        # 搜索完成
  return true if abc[0] == max_abc[0] / 2  # 终止条件
  log[abc] = depth
  [0, 1, 2].permutation(2).each{|i, j|
    # 从A,B,C中选择2个开始倒水
    if (abc[i] > 0) || (abc[j] < max_abc[j])
      next_abc = abc.clone
      move = [abc[i], max_abc[j] - abc[j]].min
      next_abc[i] -= move
      next_abc[j] += move
      return true if search(next_abc, depth + 1, max_abc, log)
    end
  }
  false
end

cnt = 0
10.step(100, 2){|a|
  (1..(a/2 - 1)).each{|c|
    b = a - c
    if b.gcd(c) == 1 then # 互质，也就是最大公约数为1
      cnt += 1 if search([a, 0, 0], 0, [a, b, c], {})
    end
  }
}
puts cnt
