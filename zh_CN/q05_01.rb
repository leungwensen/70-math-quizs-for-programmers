cnt = 0
(0..2).each{|coin500|        # 500日元硬币最多2枚
  (0..10).each{|coin100|     # 100日元硬币最多10枚
    (0..15).each{|coin50|    # 50日元硬币最多15枚
      (0..15).each{|coin10|  # 10日元硬币最多15枚
        if coin500 + coin100 + coin50 + coin10 <= 15 then
          if coin500 * 500 + coin100 * 100 +
             coin50 * 50 + coin10 * 10 == 1000 then
            cnt += 1
          end
        end
      }
    }
  }
}
puts cnt
