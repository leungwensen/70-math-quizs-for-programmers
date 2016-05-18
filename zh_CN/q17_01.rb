# 用字符表示男女
@boy, @girl = "B", "G"
N = 30

def add(seq)
  # 到达排列人数上限，终止递归
  return 1 if seq.size == N

  # 未满30人时，加男生，当右边为男生时加女生
  cnt = add(seq + @boy)
  cnt += add(seq + @girl) if seq[-1] == @boy
  return cnt
end

# 从男生或者女生开始
puts add(@boy) + add(@girl)
