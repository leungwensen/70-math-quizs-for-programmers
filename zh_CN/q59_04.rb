# 设置搜索的边界
W, H = 4, 4
# 从单元格顶点有没有往上下左右方向的线
# U: 上, D: 下, L: 左, R: 右用比特列设置方向
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 单元格顶点只计算内侧，因此行列减1
@width, @height = W - 1, H - 1
# 设置单元格顶点的可能状态
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@row = {}

# 对每行统计上下连接的组合
def make_row(cell)
  if cell.size == @width then   # 能组合出1行的时候
    u = cell.map{|l| l & U > 0} # 往上连线的位置(T/F)
    d = cell.map{|l| l & D > 0} # 往下连线的位置(T/F)
    if @row.has_key?(u) then
      @row[u][d] = @row[u].fetch(d, 0) + 1
    else
      @row[u] = {d => 1}
    end
    return
  end
  @dir.each{|d|
    # 最左侧或者左侧的线和右侧的线重合时
    if (cell.size == 0) ||
       ((d & L > 0) == (cell.last & R > 0)) then
      make_row(cell + [d])
    end
  }
end

make_row([])

# 统计第1行往下连线的组合数
count = Hash.new(0)
@row.each{|up, down|
  down.each{|k, v| count[k] += v }
}

# 从第2行开始，结合上一行进行统计
h = 1
while h < @height do
  new_count = Hash.new(0)
  count.each{|bar, cnt|
    @row[bar].each{|k, v| new_count[k] += cnt * v }
  }
  h += 1
  count = new_count
end

p count.inject(0){|sum, (k, v)| sum + v}
