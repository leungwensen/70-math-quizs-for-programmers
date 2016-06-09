# 获取下一个数字序列
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

# 记录已检索的值（0:未检索，1:循环外，2:循环内）
all_dice = Array.new(6 ** 6, 0)
(6**6).times{|i|
  if all_dice[i] == 0 then
    check = Array.new
    while (all_dice[i] == 0) && (!check.include?(i)) do
      check << i
      i = next_dice(i)
    end
    index = check.index(i)
    if (index) then # 循环发生点，这个位置前是循环外
      check.shift(index).each{|j| all_dice[j] = 1}
      check.each{|j| all_dice[j] = 2}
    else # 包含已检索值时为循环外
      check.each{|j| all_dice[j] = 1}
    end
  end
}
puts all_dice.count(1)
