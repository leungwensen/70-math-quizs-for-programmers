# 设置图块数目
W, H = 4, 3
row = [0] + [1] * (W - 1) + [0]
@edge = row + row.map{|r| 1 - r} * (H - 1) + row

def search(panel, odds)
  # 截至最后一个图块，奇数顶点是否超过2个
  return (@edge.inject(:+) > 2)?0:1 if panel >= (W + 1) * H
  # 途中で奇数点が2個を超えると一筆書き不可
  # 如果中途奇数顶点超过2个，则不可能完成一笔画
  return 0 if odds > 2

  cnt = 0
  if panel % (W + 1) < W then   # 到达行的最右侧
    # 遍历图块内没有斜线的情况
    cnt += search(panel + 1, odds + @edge[panel])

    # 图块有从左上到右下的线
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # 图块有交叉线
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
    cnt += search(panel + 1, odds + @edge[panel])

    # 图块有从右上到左下的线
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # 斜线回到原点
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
  else               # 到达行右端时，进入下一行
    cnt += search(panel + 1, odds + @edge[panel])
  end
  cnt
end

puts search(0, 0)
