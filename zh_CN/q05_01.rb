cnt = 0
(0..2).each{|coin500|        # 500円玉は最大2枚
  (0..10).each{|coin100|     # 100円玉は最大10枚
    (0..15).each{|coin50|    # 50円玉は最大15枚
      (0..15).each{|coin10|  # 10円玉は最大15枚
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
