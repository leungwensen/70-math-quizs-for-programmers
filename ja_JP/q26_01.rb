W, H = 10, 10
# 駐車場の配置を設定（周囲に番兵として「9」をセット）
parking = Array.new(W + 2){Array.new(H + 2){1}}
(W + 2).times{|w|
  parking[w][0] = parking[w][H + 1] = 9
}
(H + 2).times{|h|
  parking[0][h] = parking[W + 1][h] = 9
}

# ゴールは左上に目的の車がある状態
@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = 2

# 開始位置は右下に目的の車がある状態
start = Marshal.load(Marshal.dump(parking))
start[W][H] = 2

def search(prev, depth)
  target = []
  prev.each{|parking, w, h|
    # 上下左右に移動
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|dw, dh|
      nw, nh = w + dw, h + dh
      if (parking[nw][nh] != 9) then
        # 番兵以外の場合、過去に調べていないか調査
        temp = Marshal.load(Marshal.dump(parking))
        temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
        if !@log.has_key?([temp, nw, nh]) then
          # 過去に調べていないものを調査対象に追加
          target.push([temp, nw, nh])
          @log[[temp, nw, nh]] = depth + 1
        end
      end
    }
  }
  return if target.include?([@goal, W, H])
  # 幅優先探索で調査
  search(target, depth + 1) if target.size > 0
end

# 探索済みを記録
@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0
# 開始位置から探索開始
search([[start, W, H - 1], [start, W - 1, H]], 0)
# ゴールまでの探索数を出力
puts @log[[@goal, W, H]]
