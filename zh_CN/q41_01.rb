ip = Array.new
(1 << 16).times{|i|
  # 反转16位的数字
  j = ('%016b' % i).reverse.to_i(2)

  # 生成分割的十进制数字符串
  s = '%d.%d.%d.%d' % [i>>8, i&0xff, j>>8, j&0xff]

  # 如果只用到了10个数字和点号，则符合条件
  ip.push(s) if s.split("").uniq.length == 11
}
puts ip.size
puts ip
