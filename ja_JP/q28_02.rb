club = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14],
        [1800, 16], [1000, 15], [7000,40], [100, 10], [300, 12]]
N = 150

area = Array.new(club.size + 1){Array.new(N + 1){0}}
(club.size - 1).downto(0){|i|
  (N + 1).times{|j|
    if j < club[i][1] then
      area[i][j] = area[i + 1][j]
    else
      area[i][j] = [area[i + 1][j],
                    area[i + 1][j - club[i][1]] + club[i][0]].max
    end
  }
}
puts area[0][N]
