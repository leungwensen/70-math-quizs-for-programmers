N = 11
cards = [0] * N * 2
@count = 0

def search(cards, num)
  if num == 0 then        # 最後の判定を0に変更
    @count += 1
  else
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        cards[i], cards[i + num + 1] = num, num
        search(cards, num - 1)  # 大きい方からなので減らす
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, N)          # 最初は最大のカードを配置
puts @count
