def check(n, pre, log, square)
  if n == log.size then
    # すべてセットした場合
    if square.include?(1 + pre) then
      # 1と直前の数の和が平方数の場合
      puts n
      p log
      return true # 1つでも見つかれば終了
    end
  else
    ((1..n).to_a - log).each{|i| # 使用していない数でループ
      if square.include?(pre + i) then
        # 直前の数との和が平方数の場合
        return true if check(n, i, log + [i], square)
      end
    }
  end
  false
end

n = 2
while true do
  # 平方数を事前に算出（最大でもnの2倍まで）
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  break if check(n, 1, [1], square)
  n += 1
end
