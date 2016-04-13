W, H = 5, 6
ALL = (1 << W) - 1
# 各行の男子の人数を保持
@boys = (0..ALL).map{|i| i.to_s(2).count("1")}

# 3つの行の配置が可能か(上の2行に次の行を続けられるか)
def check(r1, r2, r3)
  result = true
  W.times{|i|                      # 1行の各位置について確認
    m1 = (0b111 << (i - 1)) & ALL  # 左右に並んでいるかのチェック
    m2 = 1 << i                    # 上下に並んでいるかのチェック
    if (r1 & m2 == m2) && (r2 & m1 == m1) && (r3 & m2 == m2) then
      result = false               # 男子が並んでいる場合はNG
    end
    if ((r1 ^ ALL) & m2 == m2) && ((r2 ^ ALL) & m1 == m1) &&
       ((r3 ^ ALL) & m2 == m2) then
      result = false               # 女子が並んでいる場合もNG
    end
  }
  result
end

# 上の2行に続く行のハッシュを作成
@next = {}
(1 << W).times{|r1|       # 1行目
  (1 << W).times{|r2|     # 2行目
    @next[[r1, r2]] = (0..ALL).select{|r3| check(r1, r2, r3)}
  }
}

@memo = {}
def search(pre1, pre2, line, used)
  if @memo.has_key?([pre1, pre2, line, used]) then
    return @memo[[pre1, pre2, line, used]] # 過去に探索済みの場合
  end

  if line >= H then                        # 最後の行まで探索した
    @memo[[pre1, pre2, line, used]] = (used == W*H/2)?1:0
    return @memo[[pre1, pre2, line, used]]
  end
  result = 0
  if line == H - 1 then                    # 最後の行の直前
    @next[[pre2, pre1]].each{|row|
      if (@next[[row, row]].include?(pre1)) &&
        (used + @boys[row] <= W * H / 2) then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  else                                     # 最後の行以外
    @next[[pre2, pre1]].each{|row|
      if used + @boys[row] <= W * H / 2 then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  end
  @memo[[pre1, pre2, line, used]] = result
end

count = 0
(1 << W).times{|r0|                        # 最初の行をセット
  count += search(r0, r0, 1, @boys[r0])
}
puts count
