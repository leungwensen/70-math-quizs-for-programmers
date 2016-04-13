N = 10

# 元の数(ビット列)に加算した場合に移動する量を返す
def move(bit, add)
  base = 0
  N.times{|i|
    base += i + 1 if (bit & (1 << i)) > 0
  }

  # 10の位の5の玉の位置を確認
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 10の位の1の玉の位置を確認
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 1の位の玉の位置を確認
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # すべての位置の差から動かす量を加算
  (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

@memo = Hash.new(0)
@memo[(1 << N) - 1] = 0

# 10まで足したときの移動量が最少になるときを求める
def search(bit)
  return @memo[bit] if @memo.has_key?(bit)
  min = 1000
  N.times{|i|
    if bit & (1 << i) == 0 then
      min = [min, move(bit, i + 1) + search(bit | (1 << i))].min
    end
  }
  @memo[bit] = min
end

puts search(0)
