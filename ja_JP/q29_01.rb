# 配列の直積を計算
def product(ary)
  result = ary[0]
  1.upto(ary.size - 1){|i|
    result = result.product(ary[i])
  }
  result.map{|r| r.flatten}
end

# 並列の場合の抵抗値を算出
def parallel(ary)
  #1.0 / ary.map{|i| 1.0 / i}.inject(:+)
  Rational(1, ary.map{|i| Rational(1, i)}.inject(:+))
end

@memo = {1 => [1]}
def calc(n)
  return @memo[n] if @memo.has_key?(n)
  # 直列
  result = calc(n - 1).map{|i| i + 1}
  # 並列
  2.upto(n){|i|
    # 並列で区切る個数を設定
    cut = {}
    (1..(n - 1)).to_a.combination(i - 1){|ary|
      pos = 0
      r = []
      ary.size.times{|j|
        r.push(ary[j] - pos)
        pos = ary[j]
      }
      r.push(n - pos)
      cut[r.sort] = 1
    }
    # 区切った位置で再帰的に抵抗を設定
    keys = cut.keys.map{|c|
      c.map{|e| calc(e)}
    }
    # 抵抗値を計算
    keys.map{|k| product(k)}.each{|k|
      k.each{|vv| result.push(parallel(vv))}
    }
  }
  @memo[n] = result
end

golden_ratio = 1.61800339887
min = Float::INFINITY
calc(10).each{|i|
  min = i if (golden_ratio - i).abs < (golden_ratio - min).abs
}
puts sprintf("%.10f", min)
puts min
