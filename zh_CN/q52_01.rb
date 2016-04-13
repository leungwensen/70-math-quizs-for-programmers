N = 8 # 砂時計の数
GOAL = [1] * N # すべて1になれば次に同時に下に落ちる

count = 0
(1..N).to_a.permutation{|init| # 初期状態を順列で設定
  hourglass = init
  pos = 0
  log = {} # 同じ状態になるかをチェックするログ
  while log[hourglass] != pos  # 過去に同じ状態があれば終了
    if hourglass == GOAL then  # 目標の形に達したら終了
      count += 1
      break
    end
    log[hourglass] = pos

    # 砂時計を減らす（残っていない場合はそのまま）
    hourglass = hourglass.map{|h| h > 0 ? h - 1 : 0}
    init[pos].times{|i|        # 砂時計を反転
      rev = (pos + i) % N
      hourglass[rev] = init[rev] - hourglass[rev]
    }
    pos = (pos + 1) % N        # 次の位置に移動
  end
}

puts count
