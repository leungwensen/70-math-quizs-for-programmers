# 读入处理日期的Date库
require 'date'

# 取出日期区间的二进制数的第5数位到第8数位的值。
from_left = 19641010.to_s(2)[4,8].to_i(2)
to_left   = 20200724.to_s(2)[4,8].to_i(2)
# 遍历左侧和右侧的8个数位
from_left.upto(to_left){|i|
  l = "%08b" % i   # 左侧
  r = l.reverse    # 右侧
  (0..1).each{|m|  # 中间
    value = "1001#{l}#{m}#{r}1001"
    begin
      puts Date.parse(value.to_i(2).to_s).strftime('%Y%m%d')
      rescue       # 忽略无效日期
    end
  }
}
