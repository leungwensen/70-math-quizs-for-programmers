@memo = {}
def cut_cake(w, h, diff)
  # 縦の方が長い場合は横長に置き換える
  w, h = h, w if w < h
  # メモに存在する場合はメモを使用する
  return @memo[[w, h, diff]] if @memo.has_key?([w, h, diff])
  # 最後まで探索した場合、差が1である場合以外は無限大とする
  if w == 1 && h == 1 then
    return @memo[[w, h, diff]] = (diff == 1)?0:Float::INFINITY
  end

  # 縦と横に切ってみる
  tate = (1..(w/2)).map{|i|
    h + cut_cake(w - i, h, i * h - diff)
  }
  yoko = (1..(h/2)).map{|i|
    w + cut_cake(w, h - i, w * i - diff)
  }
  # 縦と横の切り方のうち、最小のものを返す
  @memo[[w, h, diff]] = (tate + yoko).min
end

puts cut_cake(16, 12, 0)
