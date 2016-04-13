# 盤面のサイズ
W, H = 5, 4
@width, @height = W + 2, H + 2

NONE, BLUE, WHITE, WALL = 0, 1, 2, 9

map = Array.new(@width * @height, 0)
# 外枠を作成
@width.times{|i|
  map[i] = WALL
  map[i + @width * (@height - 1)] = WALL
}
@height.times{|i|
  map[i * @width] = WALL
  map[(i + 1) * @width - 1] = WALL
}

# 最初は(1, 1)からスタート
map[@width + 1] = BLUE
@maps = {map => false}

# 選択した色で埋めることを幅優先探索で再帰的に行う
def fill(depth, color)
  return if depth == 0
  new_maps = {}
  W.times{|w|
    H.times{|h|
      pos = w + 1 + (h + 1) * @width
      @maps.each{|k, v|
        check = false
        if k[pos] == 0 then
          [1, -1, @width, -@width].each{|d|
            check = true if k[pos + d] == color
          }
        end
        if check then
          m = k.clone
          m[pos] = color
          new_maps[m] = false
        end
      }
    }
  }
  @maps = new_maps
  fill(depth - 1, color)
end

# 青色を半分まで埋める
fill(W * H / 2 - 1, BLUE)

# 白色を空いている最初の位置に入れる
new_maps = {}
@maps.each{|k, v|
  pos = k.index(NONE)
  m = k.clone
  m[pos] = WHITE
  new_maps[m] = false
}
@maps = new_maps

# 白色を埋める
fill(W * H / 2 - 1, WHITE)

# すべて埋まっているものをカウント
count = 0
@maps.each{|m|
  count += 1 if !(m.include?(NONE))
}
puts count
