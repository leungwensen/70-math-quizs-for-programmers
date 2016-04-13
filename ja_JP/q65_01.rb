# ペアは6組
PAIR = 6

# 開始と終了を設定
start = (1..PAIR * 2 - 1).to_a + [0]
goal = [0] + (2..PAIR * 2 - 1).to_a + [1]

# 投げられる一覧を取得
def throwable(balls)
  result = []
  balls.each{|ball|
    c = ball.index(0)                     # 受け手の位置を取得
    p = (c + PAIR) % (PAIR * 2)           # 受け手の正面を計算
    [-1, 0, 1].each{|d|                   # 正面と左右
      if (p + d) / PAIR == p / PAIR then
        ball[c], ball[p + d] = ball[p + d], ball[c]
        result.push(ball.clone)           # 投げた結果をセット
        ball[c], ball[p + d] = ball[p + d], ball[c]
      end
    }
  }
  result
end

# 初期状態を設定
balls = [start]
log = [start]
cnt = 0
# 幅優先探索を実行
while !balls.include?(goal) do
  next_balls = throwable(balls)  # 次のステップを取得
  balls = next_balls - log       # 過去に現れていないものを選択
  log |= next_balls              # 投げた結果を追加
  cnt += 1
end
puts cnt
