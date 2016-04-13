N = 8                     # 各色の数
start = (1 << N) - 1      # 開始状態(0がN個、1がN個)
mask = (1 << N * 2) - 1   # ビットマスク

# ゴール状態(0と1を交互に設定)
goal1 = 0
N.times{|i| goal1 = (goal1 << 2) + 1}
goal2 = mask - goal1

# 交換回数
count = N * 2
(1 << N*2).times{|i|   # 交換する開始位置のビット列
  turn = i ^ (i << 1) ^ (i << 2)
  turn = (turn ^ (turn >> (N * 2))) & mask

  # ゴールと一致すれば交換する位置の数の最小値を判定
  if (start ^ turn == goal1) || (start ^ turn == goal2) then
    count = [count, i.to_s(2).count('1')].min
  end
}
puts count
