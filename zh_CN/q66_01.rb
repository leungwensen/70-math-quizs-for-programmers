# パネルの数を設定
W, H = 4, 3
# ビット反転用の値
XOR_ROW = (1 << (W + 1)) - 1

# 行単位に探索
def search(up, y, odds)
  # 上の行までに奇数の数が2つより多い場合は対象外
  return 0 if 2 < odds

  row = 1 << W | 1     # 初期値をセット

  # 最初と最後の行は反転
  row = XOR_ROW ^ row if (y == 0) || (y == H)

  if y == H then       # 最終行の場合はチェックして終了
    odds += (row ^ up).to_s(2).count("1")   # 奇数の数をカウント
    return 1 if (odds == 0) || (odds == 2)  # 0か2個なら対象
    return 0
  end
  cnt = 0
  (1 << W).times{|a|   # パネルの内容（左上から右下の直線有無）
    (1 << W).times{|b| # パネルの内容（左下から右上の直線有無）
      cnt += search(a ^ b << 1, y + 1,
                    odds + (row ^ up ^ a << 1 ^ b).to_s(2).count("1"))
    }
  }
  return cnt
end

puts search(0, 0, 0)
