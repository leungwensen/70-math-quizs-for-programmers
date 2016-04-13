# サイズの設定
W, H = 4, 4
# 格子点から上下左右に線が出ているかどうか
# U: 上, D: 下, L: 左, R: 右をビット列でセット
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 格子点の数は内側のため、行と列が1少ない
@width, @height = W - 1, H - 1
# 格子点として可能な形をセット（上記の説明の順番）
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@cnt, @cnt1x1 = 0, 0
@cross = []

def search(pos)
  if pos == @width * @height then # 探索終了
    @cnt += 1
    # 1x1のセルを求める
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
    # 左端の場合、または左隣からの線が右からの線と一致する。
    # または上端の場合、または上隣からの線が下からの線と一致する。
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
