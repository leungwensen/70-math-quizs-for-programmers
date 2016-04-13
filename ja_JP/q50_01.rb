W, H = 6, 5                 # 横と縦のマスの数
USABLE = 2                  # 使用可能な回数
@max = 0                    # 最長の長さ
@h = Array.new(H + 1, 0)    # 水平方向の線を使用した回数を保持
@v = Array.new(W + 1, 0)    # 垂直方向の線を使用した回数を保持

def search(x, y)
  if (x == W) && (y == H) then # Bについたら最大値を確認して終了
    @max = [@h.inject(:+) + @v.inject(:+), @max].max
    return
  end
  if @h[y] < USABLE then    # 水平方向に移動可能なとき
    if x > 0 then           # 左に移動
      @h[y] += 1
      search(x - 1, y)
      @h[y] -= 1
    end
    if x < W then           # 右に移動
      @h[y] += 1
      search(x + 1, y)
      @h[y] -= 1
    end
  end
  if @v[x] < USABLE then    # 垂直方向に移動可能なとき
    if y > 0 then           # 上に移動
      @v[x] += 1
      search(x, y - 1)
      @v[x] -= 1
    end
    if y < H then           # 下に移動
      @v[x] += 1
      search(x, y + 1)
      @v[x] -= 1
    end
  end
end

search(0, 0)                # Aの位置からスタート
puts @max
