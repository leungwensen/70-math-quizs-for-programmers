# 探索するサイズの設定
W, H = 4, 4

# 探索する関数
# pos : 探索する位置
# cells : セルが使用済みかどうかを全セルについてtrue/falseで保持
# is1x1 : 1×1のセルがあるかどうか
# 返り値 : 結合でできるパターン数と、1×1のセルが無いパターン数
def search(pos, cells, is1x1)
  if pos == W * H then # 探索終了
    if is1x1 then
      return [1, 0]
    else
      return [1, 1]
    end
  end

  # 探索する位置が探索済みの場合、次の位置に移動
  return search(pos + 1, cells, is1x1) if cells[pos]

  # 長方形を順次探索
  x, y = pos % W, pos / W
  result = [0, 0]
  (1..(H - y)).each{|dy|    # 垂直方向の大きさ
    (1..(W - x)).each{|dx|  # 水平方向の大きさ
      next_cells = cells.clone
      settable = true       # 長方形をセットできるか
      dy.times{|h|
        dx.times{|w|
          if next_cells[(x + w) + (y + h) * W] then
            # 既にセット済みの場合
            settable = false
          else
            next_cells[(x + w) + (y + h) * W] = true
          end
        }
      }
      if settable then
        # 長方形をセット可能な場合、セットして次を探索
        res = search(pos + 1, next_cells,
                     is1x1 || (dx == 1 && dy == 1))
        result[0] += res[0]
        result[1] += res[1]
      end
    }
  }
  return result
end

# セルの初期化
cells = Array.new(W * H, false)
puts search(0, cells, false)
