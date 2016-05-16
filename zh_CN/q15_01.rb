N = 10      # 楼梯级数
STEPS = 4   # 一次最大前进级数

def move(a, b)
  return 0 if a > b    # 如果A级数比B大，则结束搜索
  return 1 if a == b   # 如果停在同一级，则算入结果
  cnt = 0
  (1..STEPS).each{|da|
    (1..STEPS).each{|db|
      cnt += move(a + da, b - db) # 递归搜索
    }
  }
  cnt
end

# A从0位置开始，B从N位置开始
puts move(0, N)
