W, H = 6, 5
# マス目の初期化
@puzzle = Array.new(W + 2).map{Array.new(H + 2, 0)}
(W+2).times{|w|
  (H+2).times{|h|
    if (w==0) || (w==W+1) || (h==0) || (h==H + 1) then
      @puzzle[w][h] = -1
    end
  }
}

def fill(x, y, from, to)        # 連続チェック用に埋めていく
  if @puzzle[x][y] == from then
    @puzzle[x][y] = to
    fill(x - 1, y, from, to)
    fill(x + 1, y, from, to)
    fill(x, y - 1, from, to)
    fill(x, y + 1, from, to)
  end
end

def check()
  x, y = 1, 1
  x += 1 if @puzzle[x][y] == 1
  fill(x, y, 0, 2)              # 白マスをダミーで埋める
  result = (@puzzle.flatten.count(0) == 0)
  fill(x, y, 2, 0)              # ダミーを白マスに戻す
  result
end

def search(x, y)
  x, y = 1, y + 1 if x == W + 1 # 右端に到達したら次の行
  return 1 if y == H + 1        # 最後まで探索できれば成功
  cnt = search(x + 1, y)        # 白マスをセットして次を探索
  # 左か上が黒マス以外の場合、黒マスをセットして次を探索
  if (@puzzle[x - 1][y] != 1) && (@puzzle[x][y - 1] != 1) then
    @puzzle[x][y] = 1           # 黒マスをセット
    cnt += search(x + 1, y) if check()
    @puzzle[x][y] = 0           # 黒マスを戻す
  end
  cnt
end

p search(1, 1)                  # 左上から開始
