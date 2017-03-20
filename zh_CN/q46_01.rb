N = 4
@count = Hash.new(0)

def search()
  # 把各行设置为数值
  (0..(2**N-1)).to_a.repeated_permutation(N).each{|rows|
    # 计算各列○的个数
    col_count = Array.new(N, 0)
    N.times{|c|
      rows.each{|r|
        col_count[c] += 1 if (r & (1 << c) > 0)
      }
    }
    # 计算各行○的个数
    row_count = rows.map{|r| r.to_s(2).count("1")}
    # 用哈希表记录行和列组合的出现次数
    @count[row_count + col_count] += 1
  }
end

search()
# 输出只出现一次的组合
puts @count.select{|k, v| v == 1}.count
