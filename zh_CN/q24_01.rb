# 列举能一次击落的2个靶子的组合
board = [[1, 2], [2, 3], [7, 8], [8, 9],
         [1, 4], [3, 6], [4, 7], [6, 9]]
# 增加逐个击落的方法
1.upto(9){|i|
  board.push([i])
}

@memo = {[] => 1}
def strike(board)
  # 如果已经全部遍历完，则输出这个值
  return @memo[board] if @memo.has_key?(board)
  cnt = 0
  board.each{|b|
    # 排除含有已经击落数字的组合
    next_board = board.select{|i| (b & i).size == 0}
    cnt += strike(next_board)
  }
  @memo[board] = cnt
end

puts strike(board)
