require 'date'
WEEKS, DAYS = 6, 7

# 读入假日数据文件
@holiday = IO.readlines("q62-holiday.txt").map{|h|
  h.split('/').map(&:to_i)
}
# 读入调休工作日数据文件
@extra_workday = IO.readlines("q62-extra-workday.txt").map{|h|
  h.split('/').map(&:to_i)
}

# 计算符合条件的最大长方形的面积
def max_rectangle(cal)
  s = 0
  WEEKS.times{|row|
    DAYS.times{|left|
      (left..(DAYS - 1)).each{|right|
        # 计算高度
        h = (left..right).map{|w| cal[w + row * DAYS]}
        # 通过高度的最小值和横向长度计算面积
        s = [s, h.min * (right - left + 1)].max
      }
    }
  }
  s
end

# 指定年份月份，获取最大长方形面积
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 获取该月1日的星期
  Date.new(y, m, -1).day.times{|d|      # 循环处理直到该月结束
    if (1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])) || @extra_workday.include?([y, m, d + 1])
      # 纵向工作日延续几行？
      cal[first + d] = cal[first + d - DAYS] + 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
