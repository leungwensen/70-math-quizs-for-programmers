# 设置搜索的边界
W, H = 4, 4

# 搜索函数
# pos : 搜索位置
# cells : 用true／false表示单元格是否已经被使用
# is1x1 : 是否1×1的单元格
# 返回值 : 合并方式数目和不出现1x1单元格的合并方式数目
def search(pos, cells, is1x1)
  if pos == W * H then # 搜索结束
    if is1x1 then
      return [1, 0]
    else
      return [1, 1]
    end
  end

  # 如果搜索位置已被使用，则移动到下一个位置
  return search(pos + 1, cells, is1x1) if cells[pos]

  # 按顺序搜索矩形
  x, y = pos % W, pos / W
  result = [0, 0]
  (1..(H - y)).each{|dy|    # 垂直方向的边界
    (1..(W - x)).each{|dx|  # 水平方向的边界
      next_cells = cells.clone
      settable = true       # 能否设置矩形
      dy.times{|h|
        dx.times{|w|
          if next_cells[(x + w) + (y + h) * W] then
            # 已经设置完毕
            settable = false
          else
            next_cells[(x + w) + (y + h) * W] = true
          end
        }
      }
      if settable then
        # 如果能设置长方形，则设置并进入下一次搜索
        res = search(pos + 1, next_cells,
                     is1x1 || (dx == 1 && dy == 1))
        result[0] += res[0]
        result[1] += res[1]
      end
    }
  }
  return result
end

# 初始化单元格
cells = Array.new(W * H, false)
puts search(0, cells, false)
