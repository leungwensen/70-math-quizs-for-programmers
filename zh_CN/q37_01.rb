# 次の目を取得する
def next_dice(dice)
  right = dice.slice!(0..(dice[0].to_i - 1)).tr('123456','654321')
  dice += right
end

count = 0
(6**6).times{|i|
  # 6進数で表現して「111111」を加えることで1〜6にする
  dice = (i.to_s(6).to_i + 111111).to_s
  check = Hash.new
  j = 0

  # ループするまで次のサイコロを探す
  while !check.has_key?(dice) do
    check[dice] = j
    dice = next_dice(dice)
    j += 1
  end

  # ループした位置をチェックし、ループ対象外であればカウント
  count += 1 if check[dice] > 0
}
puts count
