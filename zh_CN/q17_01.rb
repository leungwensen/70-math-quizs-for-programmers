# 男子と女子を文字で設定
@boy, @girl = "B", "G"
N = 30

def add(seq)
  # 並べる人数に達したら終了
  return 1 if seq.size == N

  # 30人未満の場合、男子を追加するか、右端が男子の場合女子を追加
  cnt = add(seq + @boy)
  cnt += add(seq + @girl) if seq[-1] == @boy
  return cnt
end

# 男子と女子から開始してカウント
puts add(@boy) + add(@girl)
