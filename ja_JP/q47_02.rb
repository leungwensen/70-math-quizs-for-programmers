N = 4

def search(rows)
  return 1 if rows.size == N     # すべての行を探索したら終了
  count = 0
  (2**N).times{|row|
    # 4隅に○と×が交互になっているかチェック
    cross = rows.select{|r| (row & ~r) > 0 && (~row & r) > 0}
    count += search(rows + [row]) if cross.count == 0
  }
  count
end

puts search([])
