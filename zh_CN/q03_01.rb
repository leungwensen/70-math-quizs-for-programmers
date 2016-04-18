# 初始化卡牌
N = 100
cards = Array.new(N, false)

# 从2到N翻牌
(2..N).each{|i|
  j = i - 1
  while (j < cards.size) do
    cards[j] = !cards[j]
    j += i
  end
}

# 输出背面朝上的牌
N.times{|i|
  puts i + 1 if !cards[i]
}
