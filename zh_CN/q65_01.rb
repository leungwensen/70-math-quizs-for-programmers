# 设置图块数目
W, H = 4, 3
# 按位反转用的值
XOR_ROW = (1 << (W + 1)) - 1

# 按行搜索
def search(up, y, odds)
  # 截至上一行，如果奇数顶点的数目大于2，则排除这种情况
  return 0 if 2 < odds

  row = 1 << W | 1     # 设置初始值

  # 翻转最初和最后的行
  row = XOR_ROW ^ row if (y == 0) || (y == H)

  if y == H then       # 如果是最后一行，则检查后结束
    odds += (row ^ up).to_s(2).count("1")   # 计算奇数个数
    return 1 if (odds == 0) || (odds == 2)  # 如果为0或者2，则计入结果
    return 0
  end
  cnt = 0
  (1 << W).times{|a|   # 图块内容（有无左上至右下的线条）
    (1 << W).times{|b| # 图块内容（有无左下至右上的线条）
      cnt += search(a ^ b << 1, y + 1,
                    odds + (row ^ up ^ a << 1 ^ b).to_s(2).count("1"))
    }
  }
  return cnt
end

puts search(0, 0, 0)
