N = 11
@memo = {}

def search(cards, num)
  return 1 if num == 0
  return @memo[cards] if @memo.has_key?(cards)

  # ビット演算で挟む位置を設定
  mask = (1 << (num + 1)) + 1
  count = 0
  while mask < (1 << (N * 2)) do
    # 配置可能であれば、再帰的に探索
    count += search(cards | mask, num - 1) if cards & mask == 0
    # 挟む位置を一桁移動
    mask <<= 1
  end
  @memo[cards] = count
end

puts search(0, N)
