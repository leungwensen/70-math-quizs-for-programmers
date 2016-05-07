# 含有整数部分的情况
i = 1
while i += 1
  # 去除小数点，从左往右取10个字符
  str = ('%10.10f'%Math.sqrt(i)).sub('.','')[0..9]
  # 如果包含不重复的10个字符，则结束循环
  break if str.split('').uniq.length == 10
end
puts i

# 只看小数部分的情况
i = 1
while i += 1
  # 以小数点为界，只取小数部分
  str = ('%10.10f'%Math.sqrt(i)).split('.')[1]
  # 如果小数部分包含不重复的10个字符，则结束循环
  break if str.split('').uniq.length == 10
end
puts i
