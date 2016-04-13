# 次の目を取得する
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

count = 0
(6**6).times{|i|
  check = Array.new

  # ループするまで次のサイコロを探す
  while !check.include?(i) do
    check << i
    i = next_dice(i)
  end

  # ループした位置をチェックし、ループ対象外であればカウント
  count += 1 if check.index(i) != 0
}
puts count
