require 'date'
WEEKS, DAYS = 6, 7

# 祝日ファイルの読み込み
@holiday = IO.readlines("q63.txt").map{|h|
  h.split('/').map(&:to_i)
}

# カレンダーを満たす最大長方形の面積を算出
def max_rectangle(cal)
  s = 0
  WEEKS.times{|row|
    DAYS.times{|left|
      (left..(DAYS - 1)).each{|right|
        # 高さを算出
        h = (left..right).map{|w| cal[w + row * DAYS]}
        # 高さの最小値と横幅で面積を算出
        s = [s, h.min * (right - left + 1)].max
      }
    }
  }
  s
end

# 年月を指定し、面積を取得する
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 1日の曜日を取得
  Date.new(y, m, -1).day.times{|d|      # その月の日の数だけ繰り返し
    if 1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])
      # 上にいくつ平日が続いているか？
      cal[first + d] = cal[first + d - DAYS] + 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
