N = 9
@max = 0
@max_list = Hash.new

def solve(cards, init, depth)
  if cards[0] == 1 then
    if @max < depth
      @max = depth
      @max_list.clear
    end
    @max_list[init] = cards if @max == depth
  else
    solve(cards[0..(cards[0] - 1)].reverse + cards[cards[0]..N],
          init, depth + 1)
  end
end

def pattern(used, unused, index)
  if unused.empty?
    solve(used, used, 0)
  else
    unused.select{|i| index + 1 != i}.each{|i|
      pattern(used + [i], unused - [i], index + 1)
    }
  end
end

pattern([], (1..N).to_a, 0)
puts @max
puts @max_list
