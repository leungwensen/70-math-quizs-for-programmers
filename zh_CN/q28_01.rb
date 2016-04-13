club = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14],
        [1800, 16], [1000, 15], [7000,40], [100, 10], [300, 12]]
N = 150

max = 0
# 選択するクラブの数を順に試す
1.upto(club.size){|i|
  club.combination(i){|ary|
    # 選択したクラブで部員数の和が条件を満たすとき
    if ary.map{|i| i[1]}.inject(:+) <= N then
      max = [ary.map{|i| i[0]}.inject(:+), max].max
    end
  }
}

puts max
