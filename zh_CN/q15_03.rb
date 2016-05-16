N = 10      # 楼梯级数
STEPS = 4   # 一次最大前进级数

dp = Array.new(N + 1, 0)     # 统计t次移动后的位置
cnt = 0
dp[N] = 1                    # 设置初始值

N.times{|i|                  # 移动次数(最大N)
  (N + 1).times{|j|          # 移动的位置
    (1..STEPS).each{|k|
      break if k > j
      dp[j - k] += dp[j]
    }
    dp[j] = 0                # 清除移动位置
  }
  cnt += dp[0] if i % 2 == 1 # 经过偶数次移动到达相反位置
}
puts cnt
