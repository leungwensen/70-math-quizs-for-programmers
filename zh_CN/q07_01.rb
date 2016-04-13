# 日付を扱うDateクラスを読込
require 'date'

# 抽出対象の期間を設定
term = Date.parse('19641010')..Date.parse('20200724')

# 数値化
term_list = term.map{|d|d.strftime('%Y%m%d').to_i}

# 処理した結果が同じ値になるものを出力
puts term_list.select{|d|d==d.to_s(2).reverse.to_i(2)}
