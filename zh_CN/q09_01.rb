boy, girl = 20, 10
boy, girl = boy + 1, girl + 1
ary = Array.new(boy * girl){0}
ary[0] = 1
girl.times{|g|
  boy.times{|b|
    if (b != g) && (boy - b != girl - g) then
      ary[b + boy * g] += ary[b - 1 + boy * g] if b > 0
      ary[b + boy * g] += ary[b + boy * (g - 1)] if g > 0
    end
  }
}
puts ary[-2] + ary[-boy - 1]
