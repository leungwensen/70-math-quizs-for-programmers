# 反転するマスクを設定
mask = Array.new(16)
4.times{|row|
  4.times{|col|
    mask[row * 4 + col] =
      (0b1111 << (row * 4)) | (0b1000100010001 << col)
  }
}

max = 0
# ステップ数を保存する配列
steps = Array.new(1 << 16, -1)
# すべて白からスタート
steps[0] = 0
# 調査対象の配列
scanner = [0]
while scanner.size > 0 do
  check = scanner.shift
  next_steps = steps[check] + 1
  16.times{|i|
    n = check ^ mask[i]
    # 未チェックの場合、さらに調査する
    if steps[n] == -1 then
      steps[n] = next_steps
      scanner.push(n)
      max = next_steps if max < next_steps
    end
  }
end

puts max # 最大ステップ数
puts steps.index(max).to_s(2) # 初期状態のマス目：すべて黒
p steps.select{|i| i == -1} # 白にならない初期状態は無い
