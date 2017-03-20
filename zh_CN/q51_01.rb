N = 8 # 沙漏数目
GOAL = [1] * N # 如果所有沙漏剩余砂量为1，则所有砂子能同时落下

count = 0
(1..N).to_a.permutation{|init| # 顺次设置初始状态
  hourglass = init
  pos = 0
  log = {} # 用于检查是否变为同样状态的记录
  while log[hourglass] != pos  # 如果变为过去的同样状态，则终止处理
    if hourglass == GOAL then  # 如果变为目标状态，则处理结束
      count += 1
      break
    end
    log[hourglass] = pos

    # 减少沙漏砂量（如果上侧砂量为0，则保持为0）
    hourglass = hourglass.map{|h| h > 0 ? h - 1 : 0}
    init[pos].times{|i|        # 反转沙漏
      rev = (pos + i) % N
      hourglass[rev] = init[rev] - hourglass[rev]
    }
    pos = (pos + 1) % N        # 移动到下一个位置
  end
}

puts count
