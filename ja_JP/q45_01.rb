require "prime"

# 3桁の素数を取得
primes = Prime.each(1000).select{|i| i >= 100}

# 先頭の桁でハッシュを作成
prime_h = {0 => []}
primes.chunk{|i| i / 100}.each{|k, v|
  prime_h[k] = v
}

cnt = 0
primes.each{|r1|                     # 1行目
  prime_h[r1 / 100].each{|c1|        # 1列目
    prime_h[r1 % 100 / 10].each{|c2| # 2列目
      prime_h[r1 % 10].each{|c3|     # 3列目
        r2 = (c1 % 100 / 10) * 100 + (c2 % 100 / 10) * 10 +
             (c3 % 100 / 10)
        r3 = (c1 % 10) * 100 + (c2 % 10) * 10 + (c3 % 10)
        if primes.include?(r2) && primes.include?(r3) then
          cnt += 1 if [r1, r2, r3, c1, c2, c3].uniq.size == 6
        end
      }
    }
  }
}
puts cnt
