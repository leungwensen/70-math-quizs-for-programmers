N = 8                     # 各色卡片数目
start = (1 << N) - 1      # 开始状态(0N个，1N个)
mask = (1 << N * 2) - 1   # 掩码

# 目标状态（0和1交错排列）
goal1 = 0
N.times{|i| goal1 = (goal1 << 2) + 1}
goal2 = mask - goal1

# 反转次数
count = N * 2
(1 << N*2).times{|i|   # 表示开始反转位置的比特列
  turn = i ^ (i << 1) ^ (i << 2)
  turn = (turn ^ (turn >> (N * 2))) & mask

  # 到达目标状态后找出反转位置数字的最小值
  if (start ^ turn == goal1) || (start ^ turn == goal2) then
    count = [count, i.to_s(2).count('1')].min
  end
}
puts count
