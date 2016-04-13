@memo = {}

def game(coin, depth)
  return @memo[[coin, depth]] if @memo.has_key?([coin, depth])
  return 0 if coin == 0
  return 1 if depth == 0
  win = game(coin + 1, depth - 1)  # 勝ったとき
  lose = game(coin - 1, depth - 1) # 負けたとき
  @memo[[coin, depth]] = win + lose
end

puts game(10, 24)
