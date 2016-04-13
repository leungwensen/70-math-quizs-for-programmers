N = 11
cards = [0] * N * 2      # カードの初期値
@count = 0

def search(cards, num)
  if num == N + 1 then   # 最後まで置ければ成功
    @count += 1
  else
    # 置けるかどうかをチェックしながら、順に配置
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        # 置ける場合はカードを配置し、再帰的に探索
        cards[i], cards[i + num + 1] = num, num
        search(cards, num + 1)
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, 1)         # 最初は「1」のカードを配置
puts @count
