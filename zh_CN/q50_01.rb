W, H = 6, 5                 # 横向和纵向的方格数目
USABLE = 2                  # 同一条直线可以使用的次数
@max = 0                    # 最长距离
@h = Array.new(H + 1, 0)    # 保存水平方向线的使用次数
@v = Array.new(W + 1, 0)    # 保存垂直方向线的使用次数

def search(x, y)
  if (x == W) && (y == H) then # 如果到达了B点，则确认最大值，终止搜索
    @max = [@h.inject(:+) + @v.inject(:+), @max].max
    return
  end
  if @h[y] < USABLE then    # 可以水平方向移动的时候
    if x > 0 then           # 向左移动
      @h[y] += 1
      search(x - 1, y)
      @h[y] -= 1
    end
    if x < W then           # 向右移动
      @h[y] += 1
      search(x + 1, y)
      @h[y] -= 1
    end
  end
  if @v[x] < USABLE then    # 可以垂直方向移动的时候
    if y > 0 then           # 向上移动
      @v[x] += 1
      search(x, y - 1)
      @v[x] -= 1
    end
    if y < H then           # 向下移动
      @v[x] += 1
      search(x, y + 1)
      @v[x] -= 1
    end
  end
end

search(0, 0)                # 从A位置开始
puts @max
