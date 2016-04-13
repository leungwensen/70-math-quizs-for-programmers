M, N = 6, 5   # 「お菓子の包み紙」と「中身のお菓子」の数をセット
@memo = {}    # メモ化するためのハッシュ

def search(candy, color)
  return 1 if candy == [0] * N          # お菓子をすべて包めた
  # メモしていたものがあればそれを使う
  return @memo[candy + [color]] if @memo.has_key?(candy + [color])

  # 包み紙と中身が不一致なものをカウント
  cnt = 0
  candy.size.times{|i|
    if i != (color % candy.size) then   # 不一致な場合
      if candy[i] > 0 then              # お菓子が残っている場合
        candy[i] -= 1
        cnt += search(candy, color + 1) # 次を探索
        candy[i] += 1
      end
    end
  }
  @memo[candy + [color]] = cnt   # お菓子の数と色をメモに保存
end
puts search([M] * N, 0)
