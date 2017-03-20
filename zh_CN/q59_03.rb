# 设置搜索的边界
W, H = 4, 4
# 从单元格顶点有没有往上下左右方向的线
# U: 上, D: 下, L: 左, R: 右用比特列设置方向
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 单元格顶点只计算内侧，因此行列减1
@width, @height = W - 1, H - 1
# 设置单元格顶点的可能状态（按上述说明顺序）
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@cnt, @cnt1x1 = 0, 0
@cross = []

def search(pos)
  if pos == @width * @height then # 搜索结束
    @cnt += 1
    # 求1x1的单元格
    cell = Array.new(W * H, true)
    @cross.each_with_index{|c, i|
      x, y = i % @width, i / @width
      cell[x + y * W] = false if (c & U == 0) || (c & L == 0)
      cell[(x+1) + y * W] = false if (c & U == 0) || (c & R == 0)
      cell[x + (y+1) * W] = false if (c & D == 0) || (c & L == 0)
      cell[(x+1) + (y+1) * W] = false if (c & D == 0) || (c & R == 0)
    }
    @cnt1x1 += 1 if cell.index(true) == nil
    return
  end
  @dir.each{|d|
    @cross[pos] = d
    # 最左侧或者左侧的线和右侧的线重合时
    # 最上面或者上面的线和下面的线重合时
    if ((pos % @width == 0) ||
        ((@cross[pos] & L > 0) == (@cross[pos - 1] & R > 0))) &&
       ((pos / @height == 0) ||
        ((@cross[pos] & U > 0) == (@cross[pos - @height] & D > 0)))
    then
      search(pos + 1)
    end
  }
end

search(0)
puts @cnt
puts @cnt1x1
