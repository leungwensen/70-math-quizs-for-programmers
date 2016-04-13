require 'date'
WEEKS, DAYS = 6, 7

# 祝日ファイルの読み込み
@holiday = IO.readlines("q63.txt").map{|h|
  h.split('/').map(&:to_i)
}

# カレンダーを満たす最大長方形の面積を算出
def max_rectangle(cal)
  rect = 0
  WEEKS.times{|sr|          # 開始点の行
    DAYS.times{|sc|         # 開始点の列
      sr.upto(WEEKS){|er|   # 終了点の行
        sc.upto(DAYS){|ec|  # 終了点の列
          is_weekday = true # 開始点と終了点の内部に平日以外があるか
          sr.upto(er){|r|
            sc.upto(ec){|c|
              is_weekday = false if cal[c + r * DAYS] == 0
            }
          }
          if is_weekday then
            rect = [rect, (er - sr + 1) * (ec - sc + 1)].max
          end
        }
      }
    }
  }
  rect
end

# 年月を指定し、面積を取得する
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 1日の曜日を取得
  Date.new(y, m, -1).day.times{|d|      # その月の日の数だけ繰り返し
    if 1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])
      cal[first + d] = 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
