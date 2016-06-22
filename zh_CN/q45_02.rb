require "prime"

# 获取3位的质数
primes = Prime.each(1000).select{|i| i >= 100}

# 以首位数字生成哈希表
prime_h = {0 => []}
primes.chunk{|c| c / 100}.each{|k, v|
  prime_h[k] = v
}

cnt = 0
primes.each{|r1|                                   # 第1行
  prime_h[r1 / 100].each{|c1|                      # 第1列
    prime_h[(c1 % 100) / 10].each{|r2|             # 第2行
      prime_h[(r1 % 100) / 10].each{|c2|           # 第2列
        if (r2 % 100) / 10 == (c2 % 100) / 10 then # 中心点
          prime_h[c1 % 10].each{|r3|               # 第3行
            if c2 % 10 == (r3 % 100) / 10 then
              c3 = (r1 % 10) * 100 + (r2 % 10) * 10 + (r3 % 10)
              if primes.include?(c3) then          # 第3列是不是质数
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
