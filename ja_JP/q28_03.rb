club = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14],
        [1800, 16], [1000, 15], [7000,40], [100, 10], [300, 12]]

@memo = {}
def search(club, remain)
  return @memo[[club, remain]] if @memo.has_key?([club, remain])
  max = 0
  club.each{|c|
    # クラブを追加する部員数の余裕がある場合
    if remain - c[1] >= 0 then
      max = [c[0] + search(club - [c], remain - c[1]), max].max
    end
  }
  @memo[[club, remain]] = max
end

puts search(club, 150)
