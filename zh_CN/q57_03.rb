# 縦線と横線
@v, @h = 7, 10

# 再帰的に横線を作成
def make_bars(v, h)
  new_h = Array.new(h.size + v - 1, 0)
  # 各横線のパターン数をカウント
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
