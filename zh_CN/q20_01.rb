# 魔方陣を配列にセット
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]

# 集計用のハッシュ
sum = Hash.new(0)
1.upto(magic_square.size){|i|
  # 組み合わせを全探索
  magic_square.combination(i){|set|
    # 組み合わせの合計をハッシュに格納
    sum[set.inject(:+)] += 1
  }
}

# 合計が最大のものを出力
puts sum.max{|x, y| x[1] <=> y[1]}
