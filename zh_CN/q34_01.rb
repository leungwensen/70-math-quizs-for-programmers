# 盤面の設定
@board = Array.new(11).map!{Array.new(11)}
(0..10).each{|i|
  (0..10).each{|j|
    @board[i][j] = (i == 0) || (i == 10) || (j == 0) || (j == 10)
  }
}

# 集計フィールドの初期化
count = 0

# 再帰的に探索
def search(x, y, dx, dy)
  return if @board[x][y]
  @check[x * 10 + y] = 1
  search(x + dx, y + dy, dx, dy)
end

# 飛車、角を順に設定して探索
(1..9).each{|hy|
  (1..9).each{|hx|
    (1..9).each{|ky|
      (1..9).each{|kx|
        if (hx != kx) || (hy != ky) then
          @check = Hash.new()
          @board[hx][hy] = @board[kx][ky] = true
          [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|hd|
            search(hx+hd[0], hy+hd[1], hd[0], hd[1])
          }
          [[-1, -1], [-1, 1], [1, -1], [1, 1]].each{|kd|
            search(kx+kd[0], ky+kd[1], kd[0], kd[1])
          }
          @board[hx][hy] = @board[kx][ky] = false
          count += @check.size
        end
      }
    }
  }
}
puts count
