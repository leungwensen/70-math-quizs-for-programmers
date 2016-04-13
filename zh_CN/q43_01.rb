n = 5

# 初期値をセット
cards = [(1..n*2).to_a]
answer = (1..n*2).to_a.reverse

depth = 1
while true do
  # 探索
  cards = cards.each_with_object([]) do |c, result|
    1.upto(n){|i| result << c[i, n] + c[0, i] + c[i + n..-1]}
  end
  break if cards.include?(answer)
  depth += 1
end

puts depth
