# 竖线和横线
@v, @h = 7, 10

# 递归生成横线
def make_bars(v, h)
  new_h = Array.new(h.size + v - 1, 0)
  # 统计各横线的情况
  v.times{|i|
    h.each_with_index{|cnt, j|
      new_h[i+j] += cnt
    }
  }
  if v == @v + 1 then
    puts h[@h]
  else
    make_bars(v + 1, new_h)
  end
end
make_bars(1, [1])
