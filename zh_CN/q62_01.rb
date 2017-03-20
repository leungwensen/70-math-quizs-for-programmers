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
  rect = 0
  WEEKS.times{|sr|          # 起始行
    DAYS.times{|sc|         # 起始列
      sr.upto(WEEKS){|er|   # 终点行
        sc.upto(DAYS){|ec|  # 终点列
          is_weekday = true # 起始点和终点之间有没有工作日以外的日子
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

# 指定年份月份，获取最大长方形面积
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 获取该月1日的星期
  Date.new(y, m, -1).day.times{|d|      # 循环处理直到该月结束
    if (1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])) || @extra_workday.include?([y, m, d + 1])
      cal[first + d] = 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
