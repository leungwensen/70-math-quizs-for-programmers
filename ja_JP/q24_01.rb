# 2枚抜きの可能性がある抜き方をセット
board = [[1, 2], [2, 3], [7, 8], [8, 9],
         [1, 4], [3, 6], [4, 7], [6, 9]]
# 1枚ずつの抜き方を追加
1.upto(9){|i|
  board.push([i])
}

@memo = {[] => 1}
def strike(board)
  # すでに探索済みの場合はその値を使用
  return @memo[board] if @memo.has_key?(board)
  cnt = 0
  board.each{|b|
    # 抜いた的に含まれる数字がある抜き方は除外
    next_board = board.select{|i| (b & i).size == 0}
    cnt += strike(next_board)
  }
  @memo[board] = cnt
end

puts strike(board)
