N = 11
cards = [0] * N * 2      # 纸牌初始值
@count = 0

def search(cards, num)
  if num == N + 1 then   # 放置到最后时处理成功
    @count += 1
  else
    # 检查是否能放置，按顺序处理
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        # 能放置的话就放置纸牌，递归搜索下一步
        cards[i], cards[i + num + 1] = num, num
        search(cards, num + 1)
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, 1)         # 最开始放置标记为“1”的纸牌
puts @count
