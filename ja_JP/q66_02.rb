# パネルの数を設定
W, H = 4, 3
row = [0] + [1] * (W - 1) + [0]
@edge = row + row.map{|r| 1 - r} * (H - 1) + row

def search(panel, odds)
  # 最後のパネルをセットしたときに奇数点が2個を超えるか
  return (@edge.inject(:+) > 2)?0:1 if panel >= (W + 1) * H
  # 途中で奇数点が2個を超えると一筆書き不可
  return 0 if odds > 2

  cnt = 0
  if panel % (W + 1) < W then   # 行の右端以外
    # パネル内に斜線がない場合を探索
    cnt += search(panel + 1, odds + @edge[panel])

    # パネルの左上から右下への線
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # パネルをクロスする線
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
    cnt += search(panel + 1, odds + @edge[panel])

    # パネルの右上から左下への線
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # 斜線を元に戻す
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
  else               # 行の右端の場合、次の行へ
    cnt += search(panel + 1, odds + @edge[panel])
  end
  cnt
end

puts search(0, 0)
