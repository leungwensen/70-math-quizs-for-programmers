# 人数
@n = 8
# 最短移動距離
@min_step = 98
# ゴール
@goal = []
(1..@n).each{|i|
  @goal << (1..@n).to_a.reverse.rotate(i)
}

def search(child, oni, oni_pos, step, log)
  if oni == 0 then           # 最初の鬼が円から外れたとき
    if @goal.include?(child) then
      puts "#{step} #{log}"  # 移動距離と鬼が座った位置を表示
      @min_step = [step, @min_step].min
      return
    end
  end
  (1..(@n - 1)).each{|i|       # 現在の鬼の位置から順に探索
    if step + @n + i <= @min_step then
      next_child = child.clone
      pos = (oni_pos + i) % @n # 次の鬼の位置
      next_child[pos] = oni    # 鬼が座る
      next_oni = child[pos]    # 次の鬼が外に出る
      search(next_child, next_oni, pos,
             step + @n + i, log + pos.to_s)
    end
  }
end

# 最初は1の位置に鬼が入る
search([0] + (2..@n).to_a, 1, 0, @n, "0")
