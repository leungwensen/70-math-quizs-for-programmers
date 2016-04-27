# 读入处理日期的Date库
require 'date'

# 指定遍历的日期区间
term = Date.parse('19641010')..Date.parse('20200724')

# 转换成数值
term_list = term.map{|d|d.strftime('%Y%m%d').to_i}

# 输出转换结果和自身一致的值
puts term_list.select{|d|d==d.to_s(2).reverse.to_i(2)}
