N = 11
cards = [0] * N * 2
@count = 0

def search(cards, num)
  if num == 0 then        # 把终止判定改为0
    @count += 1
  else
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        cards[i], cards[i + num + 1] = num, num
        search(cards, num - 1)  # 因为从较大的开始，所以这里是减法
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, N)          # 从最大的纸牌开始
puts @count
