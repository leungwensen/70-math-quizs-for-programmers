club = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14],
        [1800, 16], [1000, 15], [7000,40], [100, 10], [300, 12]]
N = 150

max = 0
# 按顺序选择社团
1.upto(club.size){|i|
  club.combination(i){|ary|
    # 已选择社团人数满足条件时
    if ary.map{|i| i[1]}.inject(:+) <= N then
      max = [ary.map{|i| i[0]}.inject(:+), max].max
    end
  }
}

puts max
