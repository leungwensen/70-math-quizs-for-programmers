N = 6
FREE, USED, WALL = 0, 1, 9

# 番兵として両端と真ん中に壁をセット
@seat = [WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL]

def search(person)
  count = 0
  # 隣に人がいない座席を探す
  @seat.size.times{|i|
    if @seat[i] == FREE then
      if (@seat[i - 1] != USED) && (@seat[i + 1] != USED) then
        # 空いていれば座って、次を探索
        @seat[i] = USED
        count += search(person + 1)
        @seat[i] = FREE
      end
    end
  }
  # 隣に人がいない座席があれば上記でカウントした値、その他は階乗
  (count > 0) ? count : (1..@seat.count(FREE)).inject(:*)
end

puts search(0)
