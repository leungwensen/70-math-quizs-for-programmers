W, H = 10, 10
parking = [9] * (W + 1) + ([1] * W + [9]) * H + [9] * (W + 1)

@goal = parking.clone
@goal[W + 1] = 2
start = parking.clone
start[- W - 3] = 2

def search(prev, depth)
  target = []
  prev.each{|parking, pos|
    [-1, 1, W + 1, - W - 1].each{|d|
      dd = pos + d
      if (parking[dd] != 9) then
        temp = parking.clone
        temp[dd], temp[pos] = temp[pos], temp[dd]
        if !@log.has_key?([temp, dd]) then
          target.push([temp, dd])
          @log[[temp,dd]] = depth + 1
        end
      end
    }
  }
  return if target.include?([@goal, (W + 1) * (H + 1) - 2])
  search(target, depth + 1) if target.size > 0
end

@log = {}
@log[[start, (W + 1) * H - 2]] = 0
@log[[start, (W + 1) * (H + 1) - 3]] = 0

search([[start, (W+1) * H - 2], [start, (W+1) * (H+1) - 3]], 0)
puts @log[[@goal, (W + 1) * (H + 1) - 2]]
