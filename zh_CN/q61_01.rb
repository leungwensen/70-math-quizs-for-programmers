# 盤面のサイズ
W, H = 5, 4

def check(color, del)
  color.delete(del)
  # 移動先をセット
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 移動先に同じ色があればその方向を探索
  check(color, left) if (del % W > 0) && color.include?(left)
  check(color, right) if (del % W != W - 1) && color.include?(right)
  check(color, up) if (del / W > 0) && color.include?(up)
  check(color, down) if (del / W != H - 1) && color.include?(down)
end

# 盤面の初期化
map = (0.. W*H-1).to_a
count = 0
map.combination(W * H / 2){|blue|             # 半分を青にする
  if blue.include?(0) then                    # 左上は青に固定
    white = map - blue                        # 残りが白
    check(blue, blue[0])                      # 青がつながっているか
    check(white, white[0]) if blue.size == 0  # 白がつながっているか
    count += 1 if white.size == 0         # 両方つながっていればカウント
  end
}
puts count
