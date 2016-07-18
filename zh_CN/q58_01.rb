n = 14
# 设置初始状态人数(a, b, c的人数+教师通话次数)
status = [[n, 0, 0, 0]]
step = 0 # 经过时间
while status.select{|s| s[1] == n}.size == 0 do
  # 循环处理，直到不必通话的学生(b)人数变为总人数
  next_status = []
  status.each{|s|
    (s[1] + 1).times{|b|
      # 不必通话的学生联系其他学生的人数
      (s[2] + 1).times{|c|
        # 需要通话的学生联系的人数
        if s[2] > 0 then # 有可通话学生的时候
          # 有学生联系教师
          if s[0]-b-c+1 >= 0 then
            next_status << [s[0]-b-c+1, s[1]+c, s[2]+b-1, s[3]+1]
          end
        end
        # 没有学生联系教师
        if s[0]-b-c >= 0 then
          next_status << [s[0]-b-c, s[1]+c, s[2]+b, s[3]]
        end
        # 教师联系了学生
        if s[0]-b-c-1 >= 0 then
          next_status << [s[0]-b-c-1, s[1]+c+1, s[2]+b, s[3]+1]
        end
      }
    }
  }
  status = (next_status - status).uniq
  step += 1
end
# 打印经过时间
puts step
# 打印在最短时间的情况中，教师通话次数最少的情况
p status.select{|s| s[1] == n}.min{|a, b| a[3] <=> b[3]}
