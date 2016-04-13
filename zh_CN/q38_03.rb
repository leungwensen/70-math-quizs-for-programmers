# 0〜9を表すビットを定義
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 排他的論理和の結果を先に算出
@flip = Array.new(10)
(0..9).each{|i|
  @flip[i] = Array.new(10)
  (0..9).each{|j|
    @flip[i][j] = (bit[i]^bit[j]).to_s(2).count("1")
  }
}

# 毎回全ビットを反転させた値を初期値とする
@min = 63

# 再帰的に探索する
# is_used : 各数字が使用済みかどうか
# sum : 使用した数字での反転数
# prev : 前回に使用した数字
def search(is_used, sum, prev)
  if is_used.count(false) == 0 then
    @min = sum
  else
    10.times{|i|
      if !is_used[i] then
        is_used[i] = true
        next_sum = 0
        next_sum = sum + @flip[prev][i] if prev >= 0
        search(is_used, next_sum, i) if @min > next_sum
        is_used[i] = false
      end
    }
  end
end
search(Array.new(10, false), 0, -1)
puts @min
