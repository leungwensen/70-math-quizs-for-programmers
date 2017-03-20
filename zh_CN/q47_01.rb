N = 16
def graycode(value)
  # N進数を各桁の配列に分解
  digits = []
  while value > 0
    digits << value % N
    value /= N
  end

  # 各桁をグレイコードに変換
  (digits.size - 1).times{|i|
    digits[i] = (digits[i] - digits[i + 1]) % N
  }
  # 配列を数値に変換
  digits.each_with_index.map{|d, i| d * (N**i)}.inject(:+)
end

# 最初に戻るまで探索
def search(value)
  check = graycode(value)
  cnt = 1
  while check != value do
    check = graycode(check)
    cnt += 1
  end
  cnt
end

puts search(0x808080)
puts search(0xabcdef)
