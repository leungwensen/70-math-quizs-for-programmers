N = 6

max_cnt = 0
(1..N - 1).to_a.permutation(N - 1){|l|   # 左側の順番
  (1..N - 1).to_a.permutation(N - 1){|r| # 右側の順番
    # 経路を設定
    path = []
    left = 0
    right = r[0]
    (N - 1).times{|i|
      path.push([left, right])
      left = l[i]
      path.push([left, right])
      right = r[i + 1]
    }
    path.push([left, 0])

    # 経路が交差しているかを判定
    cnt = 0
    (N * 2 - 1).times{|i|
      (i + 1).upto(N * 2 - 2){|j|
        cnt += 1 if (path[i][0] - path[j][0]) *
                    (path[i][1] - path[j][1]) < 0
      }
    }
    max_cnt = [max_cnt, cnt].max
  }
}
puts max_cnt
