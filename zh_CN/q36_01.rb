# 获取下一个数字序列
def next_dice(dice)
  right = dice.slice!(0..(dice[0].to_i - 1)).tr('123456','654321')
  dice += right
end

count = 0
(6**6).times{|i|
  # 用六进制数表示的话，只需加上“111111”就变为1～6之间了
  dice = (i.to_s(6).to_i + 111111).to_s
  check = Hash.new
  j = 0

  # 找下一个序列直到进入循环
  while !check.has_key?(dice) do
    check[dice] = j
    dice = next_dice(dice)
    j += 1
  end

  # 定位循环位置，如果在循环范围外，则计数
  count += 1 if check[dice] > 0
}
puts count
