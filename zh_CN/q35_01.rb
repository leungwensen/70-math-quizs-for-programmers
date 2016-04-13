N = 6
@cnt = 0
def search(man_x, man_y, woman_x, woman_y, meet)
  if (man_x <= N) && (man_y <= N) &&
     (woman_x >= 0) && (woman_y >= 0) then
    @cnt += 1 if (man_x == N) && (man_y == N) && (meet >= 2)
    meet += 1 if (man_x == woman_x)
    meet += 1 if (man_y == woman_y)
    search(man_x + 1, man_y, woman_x - 1, woman_y, meet)
    search(man_x + 1, man_y, woman_x, woman_y - 1, meet)
    search(man_x, man_y + 1, woman_x - 1, woman_y, meet)
    search(man_x, man_y + 1, woman_x, woman_y - 1, meet)
  end
end

search(0, 0, N, N, 0)
puts @cnt
