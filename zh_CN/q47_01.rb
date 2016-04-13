N = 4
@count = Hash.new(0)

def search()
  # 各行を数値としてセット
  (0..(2**N-1)).to_a.repeated_permutation(N).each{|rows|
    # 各列の「○」の数をカウント
    col_count = Array.new(N, 0)
    N.times{|c|
      rows.each{|r|
        col_count[c] += 1 if (r & (1 << c) > 0)
      }
    }
    # 各行の「○」の数をカウント
    row_count = rows.map{|r| r.to_s(2).count("1")}
    # ハッシュに行と列のカウントで集計
    @count[row_count + col_count] += 1
  }
end

search()
# 1通りに配置できるものを出力
puts @count.select{|k, v| v == 1}.count
