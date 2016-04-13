# カードの初期化
N = 100
cards = Array.new(N, false)

# 2〜Nまで裏返す
(2..N).each{|i|
  j = i - 1
  while (j < cards.size) do
    cards[j] = !cards[j]
    j += i
  end
}

# 裏向きのカードを出力
N.times{|i|
  puts i + 1 if !cards[i]
}
