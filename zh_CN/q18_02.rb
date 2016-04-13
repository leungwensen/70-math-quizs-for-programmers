def check(last_n, used, list)
  # すべて使用済みで、先頭の「1」と平方数になると終了
  return [1] if used.all? && (list[1].include?(last_n))
  list[last_n].each{|i|           # 候補を順に試す
    if used[i - 1] == false then  # 使用済みでない場合
      used[i - 1] = true
      result = check(i, used, list)
      # 見つけた場合は、その値を追加して返す
      return [i] + result if result.size > 0
      used[i - 1] = false
    end
  }
  []
end

n = 2
while true do
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  # 隣り合う可能性がある候補を作成
  list = {}
  (1..n).each{|i|
    list[i] = square.map{|s| s - i}.select{|s| s > 0}
  }
  # 「1」を使用済みにして、「1」から探索開始
  result = check(1, [true] + [false] * (n - 1), list)
  break if result.size > 0
  n += 1
end
puts n
p result
