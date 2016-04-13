N = 10      # 階段の段数
STEPS = 4   # 一気に進める段数

dp = Array.new(N + 1, 0)     # t回の移動で移動した位置を集計
cnt = 0
dp[N] = 1                    # 初期値をセット

N.times{|i|                  # 移動回数(最大N)
  (N + 1).times{|j|          # 移動元の段
    (1..STEPS).each{|k|
      break if k > j
      dp[j - k] += dp[j]
    }
    dp[j] = 0                # 移動元はクリア
  }
  cnt += dp[0] if i % 2 == 1 # 偶数回の移動で逆に到着
}
puts cnt
