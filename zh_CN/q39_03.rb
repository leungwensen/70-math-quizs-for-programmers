N = 9
@max = 0
@max_list = Hash.new

def solve(cards, init, depth)
  (1..(cards.size - 1)).each{|i|
    if i + 1 == cards[i] then
      solve(cards[0..i].reverse + cards[(i+1)..N],
            init, depth + 1)
      check = true
    end
  }
  if @max < depth then
    @max = depth
    @max_list.clear
  end
  @max_list[cards] = init if @max == depth
end

(2..N).to_a.permutation.each{|i| solve([1] + i, [1] + i, 0)}
puts @max
puts @max_list
