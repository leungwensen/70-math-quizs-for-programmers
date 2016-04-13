require "prime"

# 3桁の素数を取得
primes = Prime.each(1000).select{|i| i >= 100}

# 先頭の桁でハッシュを作成
prime_h = {0 => []}
primes.chunk{|c| c / 100}.each{|k, v|
  prime_h[k] = v
}

cnt = 0
primes.each{|r1|                                   # 1行目
  prime_h[r1 / 100].each{|c1|                      # 1列目
    prime_h[(c1 % 100) / 10].each{|r2|             # 2行目
      prime_h[(r1 % 100) / 10].each{|c2|           # 2列目
        if (r2 % 100) / 10 == (c2 % 100) / 10 then # 中央の点
          prime_h[c1 % 10].each{|r3|               # 3行目
            if c2 % 10 == (r3 % 100) / 10 then
              c3 = (r1 % 10) * 100 + (r2 % 10) * 10 + (r3 % 10)
              if primes.include?(c3) then          # 3列目が素数か
                cnt += 1 if [r1, r2, r3, c1, c2, c3].uniq.size == 6
              end
            end
          }
        end
      }
    }
  }
}
puts cnt
