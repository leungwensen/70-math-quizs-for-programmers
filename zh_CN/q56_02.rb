@memo = {}
def cut_cake(w, h, diff)
  # 如果纵向较长，则替换成横向
  w, h = h, w if w < h
  # 如果存在缓存，则应用缓存
  return @memo[[w, h, diff]] if @memo.has_key?([w, h, diff])

  # 搜索到最后，除了相差1以外的都设置成无穷大
  if w == 1 && h == 1 then
    return @memo[[w, h, diff]] = (diff == 1)?0:Float::INFINITY
  end

  # 剪枝（相差大于蛋糕的一半，则设置为无穷大）
  return Float::INFINITY if w * h / 2 < diff

  # 横向纵向切分
  tate = (1..(w/2)).map{|i|
    h + cut_cake(w - i, h, i * h - diff)
  }
  yoko = (1..(h/2)).map{|i|
    w + cut_cake(w, h - i, w * i - diff)
  }
  # 从横向纵向两种切法中选较小的一个
  @memo[[w, h, diff]] = (tate + yoko).min
end

puts cut_cake(16, 12, 0)
