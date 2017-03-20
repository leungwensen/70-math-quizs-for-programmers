N = 4

def search(rows)
  return 1 if rows.size == N # 已搜索完所有行，结束搜索
  count = 0
  (2**N).times{|row|
    # 四个对角○和×是否交错出现
    cross = rows.select{|r| (row & ~r) > 0 && (~row & r) > 0}
    count += search(rows + [row]) if cross.count == 0
  }
  count
end

puts search([])
