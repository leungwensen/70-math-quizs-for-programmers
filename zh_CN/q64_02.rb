# 6组对手
PAIR = 6

# 设置起始和终止状态
start = (1..PAIR * 2 - 1).to_a + [0]
goal = [0] + (2..PAIR * 2 - 1).to_a + [1]

# 获取投接球状态列表
def throwable(balls)
  result = []
  balls.each{|ball|
    c = ball.index(0)                     # 获取接球手位置
    p = (c + PAIR) % (PAIR * 2)           # 计算接球手对面位置
    [-1, 0, 1].each{|d|                   # 正对面及其左右
      if (p + d) / PAIR == p / PAIR then
        ball[c], ball[p + d] = ball[p + d], ball[c]
        result.push(ball.clone)           # 设置投球结果
        ball[c], ball[p + d] = ball[p + d], ball[c]
      end
    }
  }
  result
end

# 设定初始状态
fw = [start]
fw_log = [start]
bw = [goal]
bw_log = [goal]
cnt = 0

# 双向的广度优先搜索
while true do
  next_fw = throwable(fw)      # 正向的下一步
  fw = next_fw - fw_log        # 选择之前没有出现过的投球方案
  fw_log |= next_fw            # 添加投球结果
  cnt += 1
  break if (fw & bw).size > 0  # 如果状态相同，则终止处理

  next_bw = throwable(bw)      # 反向的下一步
  bw = next_bw - bw_log        # 选择之前没有出现过的投球方案
  bw_log |= next_bw            # 添加投球结果
  cnt += 1
  break if (fw & bw).size > 0  # 如果状态相同，则终止处理
end
puts cnt
