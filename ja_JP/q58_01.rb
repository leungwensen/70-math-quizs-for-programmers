n = 14
# 初期状態の人数をセット(a, b, cの人数 ＋ 先生が電話した回数)
status = [[n, 0, 0, 0]]
step = 0 # 経過時間
while status.select{|s| s[1] == n}.size == 0 do
  # 連絡が不要な生徒(b)が全員になるまで以下を繰り返す
  next_status = []
  status.each{|s|
    (s[1] + 1).times{|b|
      # 連絡が不要な生徒が他の生徒に連絡する人数
      (s[2] + 1).times{|c|
        # 連絡が必要な生徒が連絡する人数
        if s[2] > 0 then # 発信できる生徒がいるとき
          # 生徒から先生あり
          if s[0]-b-c+1 >= 0 then
            next_status << [s[0]-b-c+1, s[1]+c, s[2]+b-1, s[3]+1]
          end
        end
        #先生なし
        if s[0]-b-c >= 0 then
          next_status << [s[0]-b-c, s[1]+c, s[2]+b, s[3]]
        end
        # 先生から生徒あり
        if s[0]-b-c-1 >= 0 then
          next_status << [s[0]-b-c-1, s[1]+c+1, s[2]+b, s[3]+1]
        end
      }
    }
  }
  status = (next_status - status).uniq
  step += 1
end
# 経過時間を表示
puts step
# 最短の中で、先生が電話する回数が最少のものを表示
p status.select{|s| s[1] == n}.min{|a, b| a[3] <=> b[3]}
