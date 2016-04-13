# 次の目を取得する
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

# 探索した値を記録する(0:未探索、1:ループ以外、2:ループ)
all_dice = Array.new(6 ** 6, 0)
(6**6).times{|i|
  if all_dice[i] == 0 then
    check = Array.new
    while (all_dice[i] == 0) && (!check.include?(i)) do
      check << i
      i = next_dice(i)
    end
    index = check.index(i)
    if (index) then # ループしたとき、その位置以前はループ以外
      check.shift(index).each{|j| all_dice[j] = 1}
      check.each{|j| all_dice[j] = 2}
    else # すでにチェック済みの値に当たった時はループ以外
      check.each{|j| all_dice[j] = 1}
    end
  end
}
puts all_dice.count(1)
