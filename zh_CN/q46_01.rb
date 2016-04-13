N = 7
checked = {(1..N).to_a => 0} # チェック済みの配列
check = [(1..N).to_a]        # チェック対象
depth = 0                    # 交換回数

while check.size > 0 do      # チェック対象が存在する間、繰り返す
  next_check = []
  (0..(N-1)).to_a.combination(2){|i, j|  # 2カ所選択して交換
    check.each{|c|
      d = c.clone
      d[i], d[j] = d[j], d[i]
      if !checked.has_key?(d) then
        checked[d] = depth + 1
        next_check << d
      end
    }
  }
  check = next_check
  depth += 1
end

puts checked.values.inject(:+)
