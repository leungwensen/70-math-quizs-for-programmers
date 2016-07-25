@n = 8
# 包含丢手绢的人
@all = (0..@n).to_a

# 初始状态
start = {}
start[(1..@n).to_a] = []

# 终止状态
goal = {}
@n.times{|i|
  goal[(1..@n).to_a.reverse.rotate(i)] = []
}

# 求移动距离
def dist(log)
  return 0 if log.size == 0
  check = log.clone
  pre = check.shift
  sum = @n + pre
  check.each{|c|
    sum += @n + (c + @n - pre) % @n
    pre = c
  }
  sum
end

# 搜索（direction为true时是顺序方向，false时为逆序方向）
def search(child, direction)
  child.clone.each{|key, value|
    oni = (@all - key)[0] # 没有被使用的就是丢手绢的人
    @n.times{|i|
      k = key.clone
      k[i] = oni
      v = value + [i]
      if child.has_key?(k) then
        if direction then # 顺序方向
          child[k] = v if dist(v) < dist(child[k])
        else              # 逆序方向
          child[k] = v if dist(v.reverse) < dist(child[k].reverse)
        end
      else
        child[k] = v
      end
    }
  }
end

cnt = 0
while (start.keys & goal.keys).size == 0 do
  if cnt % 2 == 0 then # 偶数时顺序方向搜索
    search(start, cnt % 2 == 0)
  else                 # 奇数时逆序方向搜索
    search(goal, cnt % 2 == 0)
  end
  cnt += 1
end

# 双向搜索结果合流时，计算最短移动距离
min = 98
(start.keys & goal.keys).each{|c|
  d = dist(start[c] + goal[c].reverse)
  min = [min, d].min
}

puts min
