# サイズの設定
W, H = 4, 4
# 格子点から上下左右に線が出ているかどうか
# U: 上, D: 下, L: 左, R: 右
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 格子点の数は内側のため、行と列が1少ない
@width, @height = W - 1, H - 1
# 格子点として可能な形をセット
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@row = {}

# 1行での上下のつながり方を作成
def make_row(cell)
  if cell.size == @width then   # 1行分を作成できたとき
    u = cell.map{|l| l & U > 0} # 上方向に線が出ている位置(T/F)
    d = cell.map{|l| l & D > 0} # 下方向に線が出ている位置(T/F)
    if @row.has_key?(u) then
      @row[u][d] = @row[u].fetch(d, 0) + 1
    else
      @row[u] = {d => 1}
    end
    return
  end
  @dir.each{|d|
    # 左端または左隣からの線が右からの線と一致する。
    if (cell.size == 0) ||
       ((d & L > 0) == (cell.last & R > 0)) then
      make_row(cell + [d])
    end
  }
end

make_row([])

# 最初の行で下に線が出ている件数を合計
count = Hash.new(0)
@row.each{|up, down|
  down.each{|k, v| count[k] += v }
}

# 2行目以降について、前の行とつながる数を合計
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
