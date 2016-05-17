MAX = 500

answer = []
(1..MAX/4).each{|c|           # 正方形边长
  edge = (1..(c-1)).to_a.map{|tate| tate * (2 * c - tate)}
  edge.combination(2){|a, b|  # 长方形面积
    if a + b == c * c then
      answer.push([1, b / a.to_f, c * c / a.to_f])
    end
  }
}
answer.uniq!                  # 去除整数倍的情况
puts answer.size
