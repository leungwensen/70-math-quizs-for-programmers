def cutbar(m, n, current) # currentは現在の棒の数
  if current >= n then
    0 # 切り終えた
  elsif current < m then
    1 + cutbar(m, n, current * 2) # 次は現在の2倍になる
  else
    1 + cutbar(m, n, current + m) # はさみの数だけ追加
  end
end

puts cutbar(3, 20, 1)
puts cutbar(5, 100, 1)
