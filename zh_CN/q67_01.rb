W, H = 6, 5
# 初始化网格
@puzzle = Array.new(W + 2).map{Array.new(H + 2, 0)}
(W+2).times{|w|
  (H+2).times{|h|
    if (w==0) || (w==W+1) || (h==0) || (h==H + 1) then
      @puzzle[w][h] = -1
    end
  }
}

def fill(x, y, from, to)        # 填充元素，确认是否连续
  if @puzzle[x][y] == from then
    @puzzle[x][y] = to
    fill(x - 1, y, from, to)
    fill(x + 1, y, from, to)
    fill(x, y - 1, from, to)
    fill(x, y + 1, from, to)
  end
end

def check()
  x, y = 1, 1
  x += 1 if @puzzle[x][y] == 1
  fill(x, y, 0, 2)              # 在白色方格填入临时数据
  result = (@puzzle.flatten.count(0) == 0)
  fill(x, y, 2, 0)              # 临时数据恢复为白色方格
  result
end

def search(x, y)
  x, y = 1, y + 1 if x == W + 1 # 到达最右侧，进入下一行处理
  return 1 if y == H + 1        # 收缩到最后则代表成功
  cnt = search(x + 1, y)        # 设置白色方格，进入下一个搜索
  # 除去左边或者上边是黑色方格的情况以外，设置黑色方格并进入下一个搜索
  if (@puzzle[x - 1][y] != 1) && (@puzzle[x][y - 1] != 1) then
    @puzzle[x][y] = 1           # 设置黑色方格
    cnt += search(x + 1, y) if check()
    @puzzle[x][y] = 0           # 恢复黑色方格
  end
  cnt
end

p search(1, 1)                  # 从左上角开始
