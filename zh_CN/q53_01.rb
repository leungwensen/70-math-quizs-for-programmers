M, N = 6, 5   # 设置“糖果包装纸”和“糖果本身”的数目
@memo = {}    # 内存化所用的哈希表

def search(candy, color)
  return 1 if candy == [0] * N          # 所有糖果都包好了
  # 如果存在内存化的结果，则使用
  return @memo[candy + [color]] if @memo.has_key?(candy + [color])

  # 统计包装纸和糖果口味不一致的组合
  cnt = 0
  candy.size.times{|i|
    if i != (color % candy.size) then   # 不一致的情况
      if candy[i] > 0 then              # 还剩下糖果的情况
        candy[i] -= 1
        cnt += search(candy, color + 1) # 进入下一层搜索
        candy[i] += 1
      end
    end
  }
  @memo[candy + [color]] = cnt   # 把糖果的数目和颜色保存起来
end
puts search([M] * N, 0)
