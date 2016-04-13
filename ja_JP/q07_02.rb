# 日付を扱うDateクラスを読込
require 'date'

# 対象の期間で、2進数の5文字目から8文字を抽出
from_left = 19641010.to_s(2)[4,8].to_i(2)
to_left   = 20200724.to_s(2)[4,8].to_i(2)
# 左右の8文字をループ
from_left.upto(to_left){|i|
  l = "%08b" % i   # 左側
  r = l.reverse    # 右側
  (0..1).each{|m|  # 中央
    value = "1001#{l}#{m}#{r}1001"
    begin
      puts Date.parse(value.to_i(2).to_s).strftime('%Y%m%d')
      rescue       # 有効な日付以外は無視
    end
  }
}
