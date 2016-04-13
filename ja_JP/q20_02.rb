# 魔方陣を配列にセット
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]
sum_all = magic_square.inject(:+)

# 集計用のハッシュ
sum = Array.new(sum_all + 1){0}
# 初期値（何も足さないときが1個）
sum[0] = 1
magic_square.each{|n|
  # 大きい方から順に加算
  (sum_all - n).downto(0).each{|i|
    sum[i + n] += sum[i]
  }
}

# 合計が最大のものを出力
puts sum.find_index(sum.max)
